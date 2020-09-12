# frozen_string_literal: true

class SavesController < ApplicationController
    before_action :authenticate_member, { only: %i[create] }
  
    def index
      post_ids = Save.where(member_id: @current_member.id).pluck(:post_id)
      @posts = Post.where(id: post_ids)
    end
  
    def create
      Save.create(post_id: params[:id], member_id: @current_member.id)
      redirect_to('/saves')
    end
  end