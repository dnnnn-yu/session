# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :forbidden_login_member, { only: %i[login login_form signup create] }
  before_action :authenticate_member, { only: %i[logout edit] }

  def signup
    @member = Member.new
  end

  def login
    if Member.find_by(login_params)
      session[:member_id] = Member.find_by(login_params).id
      cookies[:member_id] = Member.find_by(login_params).id
      flash[:notice] = 'ログイン完了'
      redirect_to('/')
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @member = Member.new
      @email = login_params[:email]
      @password = login_params[:password]
      render('members/login_form')
    end
  end

  def login_form
    @member = Member.new
  end

  def logout
    session[:member_id] = nil
    cookies[:member_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to('/')
  end

  def new
    if @current_member
      @member = Member.find_by(id: @current_member.id)
      @regist = true
    else
      flash[:warning] = 'メールアドレスまたはパスワードに不備があります'
      redirect_to('/signup')
    end
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  def edit
    if @current_member.id.to_s == params[:id]
      @member = Member.find_by(id: params[:id])
    else
      redirect_to('/')
      flash[:warning] = '権限がありません'
    end
  end

  def modify_email
    email1 = email_params[:email]
    email2 = email_params[:email_again]
    if email1 != email2
      @error_message = "メールアドレスが異なります"
      @member = @current_member
      render("home/change_email")
    elsif email1.length == 0
      @error_message = "メールアドレスに不備があります"
      @member = @current_member
      render("home/change_email")
    elsif Member.find_by(email: email1)
      @error_message = "既に使われているメールアドレスです"
      @member = @current_member
      render("home/change_email")
    else
      @current_member.update(email: email1)
      flash[:notice] = "変更完了"
      redirect_to("/email")
    end
  end

  def modify_password
    password_now = password_params[:password_now]
    password_new = password_params[:password_new]
    password_again = password_params[:password_again]
    if @current_member.password != password_now
      @error_message = "パスワードに誤りがあります"
      @member = @current_member
      render("home/change_password")
    elsif password_new != password_again
      @error_message = "再入力のパスワードが異なります"
      @member = @current_member
      render("home/change_password")
    elsif password_new.length == 0
      @error_message = "新しいパスワードに不備があります"
      @member = @current_member
      render("home/change_password")
    else
      @current_member.update(password: password_new)
      flash[:notice] = "パスワード変更完了"
      redirect_to("/")
    end
  end

  def create
    if Member.find_by(email: login_params[:email])
      redirect_to('/signup')
      flash[:warning] = '既に使われているメールアドレスです'
    else
      @member = Member.new(
        email: login_params[:email],
        password: login_params[:password],
        name: 'No name',
        image: '/icon.jpg'
      )
      @member.save
      cookies[:member_id] = @member.id
      session[:member_id] = @member.id
      redirect_to('/members/new')
    end
  end

  def update
    @member = Member.find_by(id: params[:id])
    @member.update(member_params)
    if @member.save
      @member.score = set_score(@member)
      @member.save
      flash[:notice] = 'プロフィール編集完了'
      redirect_to('/')
    else
      @regist = true
      @error_message = '名前が未入力です'
      render('members/edit')
    end
  end

  def destroy
    @current_member.destroy
    Relation.where(member_id: @current_member.id).destroy_all
    Like.where(account_id: @current_member.id, account_type: 'member').destroy_all
    Like.where(member_id: @current_member.id).destroy_all
    Block.where(to_id: @current_member.id).destroy_all
    Block.where(from_id: @current_member.id).destroy_all
    Inquiry.where(user_id: @current_member.id).destroy_all
    Save.where(member_id: @current_member.id).destroy_all
    Participant.where(member_id: @current_member.id).destroy_all
    session[:member_id] = nil
    cookies[:member_id] = nil
    flash[:notice] = '退会完了'
    redirect_to('/')
  end

  private

  def member_params
    record_params = params.require(:member).permit(:name, :birthday, :gender, :pref, :profile, :id, :image, :portfolio, parts: [], status: [])
    record_params[:parts] = record_params[:parts].join if record_params[:parts]
    if record_params[:status]
      record_params[:status] = record_params[:status].join
    end
    record_params
  end

  def email_params
    params.require(:member).permit(:email, :email_again)
  end

  def password_params
    params.require(:member).permit(:password_now, :password_new, :password_again)
  end

  def login_params
    params.require(:member).permit(:email, :password)
  end

  def set_score(member)
    score = 0
    # カラムをどれだけ埋めているかでポイント加算
    score += 10 if member.name.present?
    score += 20 if member.birthday.present?
    score += 20 if member.pref.present?
    score += 50 if member.image.present?
    score += 30 if member.parts.present?
    score += 30 if member.status.present?
    score += 50 if member.profile.present?
    score += 50 if member.profile.length > 140

    # 最終編集日がどれだけ最近かでポイント加算
    score += 50 if (Date.today - member.updated_at.to_date).to_i <= 7
    score += 50 if (Date.today - member.updated_at.to_date).to_i <= 14
    score += 100 if (Date.today - member.updated_at.to_date).to_i <= 28

    score
  end
end
