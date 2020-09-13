# frozen_string_literal: true

class SearchController < ApplicationController
  def member_form
    @search = Member.ransack(params[:q])
  end

  def member_search
    @search = Member.ransack(member_search_params)
    @members = if @current_member
                 @search.result.where.not(id: @current_member.id).order(score: 'desc')
               else
                 @search.result.order(score: 'desc')
               end
  end

  def post_form
    @search = Post.ransack(params[:q])
  end

  def post_search
    @search = Post.ransack(post_search_params)
    @posts = @search.result.where.not(member_id: @current_member&.id).order(score: 'desc')
  end

  private

  def member_search_params
    search_params = params.require(:q).permit!
    search_params[:pref_eq] = Member.prefs[search_params[:pref_eq]]
    search_params[:birthday_lteq] = Date.current.prev_year(search_params[:birthday_lteq].to_i)
    search_params[:birthday_gteq] = Date.current.prev_year(search_params[:birthday_gteq].to_i + 1).tomorrow
    search_params
  end

  def post_search_params
    search_params = params.require(:q).permit!
    search_params[:pref_eq] = Post.prefs[search_params[:pref_eq]]
    search_params
  end
end
