# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: 'DESC').first(7)

    if @current_member&.pref
      pref = @current_member.pref_before_type_cast
      area = []
      if pref >= 2 && pref <= 7
        area = [2, 3, 4, 5, 6, 7]
      elsif  pref >= 8 && pref <= 14
        area = [8, 9, 10, 11, 12, 13, 14]
      elsif  pref >= 15 && pref <= 18
        area = [15, 16, 17, 18]
      elsif  pref >= 19 && pref <= 23
        area = [19, 20, 21, 22, 23]
      elsif  pref >= 24 && pref <= 30
        area = [24, 25, 26, 27, 28, 29, 30]
      elsif  pref >= 31 && pref <= 35
        area = [31, 32, 33, 34, 35]
      elsif  pref >= 36 && pref <= 39
        area = [36, 37, 38, 39]
      elsif  pref >= 40 && pref <= 46
        area = [40, 41, 42, 43, 44, 45, 46]
      elsif pref ==  47
        area = [47]
      end
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
