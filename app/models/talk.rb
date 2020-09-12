# frozen_string_literal: true

class Talk < ApplicationRecord
  validates :content, presence: true
  after_create_commit { TalkBroadcastJob.perform_later self }
end
