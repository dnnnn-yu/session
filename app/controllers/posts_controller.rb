# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = @current_member.posts
  end

  def show
    @post = @current_member.posts
  end

  def new
    @post = Post.new
  end

  def edit
    if Post.find_by(id: params[:id], member_id: @current_member.id)
      @post = Post.find_by(id: params[:id])
    else
      redirect_to('/')
      flash[:warning] = '権限がありません'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = @current_member.id
    if @post.save
      @post.score = set_score(@post)
      @post.save
      redirect_to('/')
    else
      @error_message = 'タイトルが空白です'
      render('posts/new')
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    @post.score = set_score(@post)
    @post.save
    redirect_to('/')
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to('/posts')
  end

  private

  def post_params
    record_params = params.require(:post).permit(:band_id, :title, :pref, :content, :gender, :portfolio, :age_min, :age_max, parts: [], status: [])
    if record_params[:status]
      record_params[:status] = record_params[:status].join
    end
    record_params[:parts] = record_params[:parts].join if record_params[:parts]
    record_params
  end

  def set_score(post)
    score = 0
    # カラムをどれだけ埋めているかでポイント加算
    score += 50 if post.status.present?
    score += 50 if post.parts.present?
    score += 50 if post.content.present?
    score += 50 if post.content.length > 140

    # 最終編集日がどれだけ最近かでポイント加算
    score += 50 if (Date.today - post.updated_at.to_date).to_i <= 7
    score += 50 if (Date.today - post.updated_at.to_date).to_i <= 14
    score += 100 if (Date.today - post.updated_at.to_date).to_i <= 28

    score
  end
end
