# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_member, { only: %i[show create index] }
  def index
    @rooms = @current_member.participant_rooms
    @block_members_ids = @current_member.block_members.pluck(:id)
  end

  def show
    @member_id = Participant.where(room_id: params[:id]).where.not(member_id: @current_member.id).first.member_id
    @room = Room.find(params[:id])
    @talks = Talk.where(room_id: @room.id)
  end

  def create
    room_ids = Participant.where(member_id: @current_member.id).pluck(:room_id)
    room_id = Participant.find_by(member_id: params[:id], room_id: room_ids)
    if room_id
      redirect_to("/rooms/#{room_id.room_id}")
    else
      room = Room.create
      Participant.create(room_id: room.id, member_id: @current_member.id)
      Participant.create(room_id: room.id, member_id: params[:id])
      redirect_to("/rooms/#{room.id}")
    end
  end
end
