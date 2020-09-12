# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room]}_#{params[:myid]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Talk.create! content: data['talk'], member_id: cookies[:member_id], room_id: params[:room]
  end

  private

  def cookies
    connection.send(:cookies)
  end
end
