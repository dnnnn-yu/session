# frozen_string_literal: true

class AttentionController < ApplicationController
  before_action :authenticate_member, { only: %i[like_create save_create] }
  def like_index
    member_ids = Like.where(member_id: @current_member.id, account_type: 'member').pluck(:account_id)
    @members = Member.where(id: member_ids)
  end

  def like_create
    Like.create(account_id: params[:id], account_type: params[:type], member_id: @current_member.id)
    redirect_to('/likes')
  end

  def save_index
    post_ids = Save.where(member_id: @current_member.id).pluck(:post_id)
    @posts = Post.where(id: post_ids)
  end

  def save_create
    Save.create(post_id: params[:id], member_id: @current_member.id)
    redirect_to('/saves')
  end
end
