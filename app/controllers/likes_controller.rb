# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_member, { only: %i[create] }  

  def index
    @members = @current_member.like_member_accounts
  end

  def create
    Like.create(account_id: params[:id], type: params[:type].classify, member_id: @current_member.id)
    redirect_to('/likes')
  end
end
