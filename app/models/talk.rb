# frozen_string_literal: true

class Talk < ApplicationRecord
  belongs_to :member
  belongs_to :room 

  validates :content, presence: true
  after_create_commit { TalkBroadcastJob.perform_later self }
end
