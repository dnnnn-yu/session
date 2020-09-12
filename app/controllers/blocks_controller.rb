# frozen_string_literal: true

class BlocksController < ApplicationController
  def create
    Block.create(from_id: @current_member.id, to_id: params[:id])
    redirect_to('/rooms')
  end

  def destroy
    Block.find_by(id: params[:id]).destroy
    flash[:notice] = '解除完了'
    redirect_to('/inquiry')
  end
end
