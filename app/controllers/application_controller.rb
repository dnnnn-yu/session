# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Master
  before_action :set_current_member

  def set_current_member
    @current_member = Member.find_by(id: session[:member_id])
  end

  def authenticate_member
    if @current_member.nil?
      flash[:warning] = 'ログインが必要です'
      redirect_back(fallback_location: '/')
    end
  end

  def forbidden_login_member
    if @current_member
      flash[:warning] = 'ログイン中です'
      redirect_to('/')
    end
  end
end
