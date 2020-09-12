# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :participant_room, class_name: 'Room', foreign_key: :room_id
  belongs_to :participant_member, class_name: 'Member', foreign_key: :member_id

  validates :room_id, uniqueness: { scope: :member_id }
end
