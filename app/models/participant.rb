# frozen_string_literal: true

class Participant < ApplicationRecord
  has_many :rooms
  has_many :members
  validates :room_id, uniqueness: { scope: :member_id }
end
