# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: 'DESC').first(7)

    if @current_member&.pref
      area = belongs_region(@current_member.pref_before_type_cast)[:pref_numbers]
      @recommend_posts = Post.ransack(
        'pref_eq_any' => area,
        'status_cont_any' => @current_member.status&.split(''),
        'parts_cont_any' => @current_member.parts&.split('')
      ).result

      @recommend_posts = nil if @recommend_posts.count == 0
    end
  end

  def admin
    redirect_to('/') unless @current_member&.admin
    @members_today = Member.where(created_at: Date.today.midnight..Date.today.end_of_day).count
    @members_week =  Member.where(created_at: 1.week.ago..Date.today.end_of_day).count
    @members_month = Member.where(created_at: 1.month.ago..Date.today.end_of_day).count
    @members_all = Member.count
  end

  def inquiry_index
    redirect_to('/') unless @current_member&.admin
    @inquiries = Inquiry.all.order(id: 'DESC')
  end

  def inquiry
    @inquiry = Inquiry.new
  end

  def create_inquiry
    inquiry = Inquiry.new(inquiry_params)
    inquiry.user_id = @current_member.id
    inquiry.save
    flash[:notice] = '送信完了'
    redirect_to('/inquiry')
  end

  def change_email
    @member = @current_member
  end

  def change_password
    @member = @current_member
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :content)
  end
end
