# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_member, { only: %i[create] }  

  def index
    member_ids = Like.where(member_id: @current_member.id, account_type: 'member').pluck(:account_id)
    @members = Member.where(id: member_ids)
  end

  def create
    Like.create(account_id: params[:id], account_type: params[:type], member_id: @current_member.id)
    redirect_to('/likes')
  end
end