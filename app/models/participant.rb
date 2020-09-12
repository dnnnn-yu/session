# frozen_string_literal: true

class Participant < ApplicationRecord
  validates :room_id, uniqueness: { scope: :member_id }
end
