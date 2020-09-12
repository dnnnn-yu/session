# frozen_string_literal: true

class TalkBroadcastJob < ApplicationJob
  queue_as :default

  def perform(talk)
    Participant.where(room_id: talk.room_id).each do |participant|
      if talk.member_id == participant.member_id
        ActionCable.server.broadcast "room_channel_#{talk.room_id}_#{participant.member_id}", talk: render_my_talk(talk)
      else
        ActionCable.server.broadcast "room_channel_#{talk.room_id}_#{participant.member_id}", talk: render_your_talk(talk)
      end
    end
  end

  private

  def render_your_talk(talk)
    ApplicationController.renderer.render partial: 'talks/yourtalk', locals: { talk: talk }
  end

  def render_my_talk(talk)
    ApplicationController.renderer.render partial: 'talks/mytalk', locals: { talk: talk }
  end
end
