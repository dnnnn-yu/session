# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_member, { only: %i[show create index] }
  def index
    block_members = Block.where(from_id: @current_member.id).pluck(:to_id)
    room_ids = Participant.where(member_id: @current_member.id).pluck(:room_id)
    # そのroomの各メンバーの中にblock_membersに含まれているメンバーがいれば非表示
    # 今は1対1なので機能するが、もし今後、複数人のトークグループを作った時に、
    # そのroomに一人でもブロックしている人がいれば非表示になってしまうので注意↓
    room_ids.each do |i|
      Participant.where(room_id: i).pluck(:member_id).each do |m|
        room_ids.delete(i) if block_members.include?(m)
      end
    end

    # room毎の最新talkのcreated_at,talkがない場合はroomのcreated_atで並べ替え
    room_ids_with_time = []

    room_ids.each do |i|
      room_ids_with_time << if Talk.find_by(room_id: i)
                              [i, Talk.where(room_id: i).last.created_at]
                            else
                              [i, Room.find_by(id: i).created_at]
                            end
    end

    room_ids_with_time.sort! { |a, b| b[1] <=> a[1] }
    room_ids_with_time.map! { |x| x[0] }

    @rooms = []

    room_ids_with_time.each do |r|
      @rooms << Room.find_by(id: r)
    end
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
