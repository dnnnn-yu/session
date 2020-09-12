# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :participants
  has_many :participant_members, through: :participants
  has_many :talks
end
