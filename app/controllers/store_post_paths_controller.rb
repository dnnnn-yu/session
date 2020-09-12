# frozen_string_literal: true

class StorePostPathsController < ApplicationController
    before_action :authenticate_member, { only: %i[create] }
  
    def index
      @posts = @current_member.store_posts
    end
  
    def create
      StorePost.create(post_id: params[:id], member_id: @current_member.id)
      redirect_to('/store_post_paths')
    end
  end