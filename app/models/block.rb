# frozen_string_literal: true

class Block < ApplicationRecord
  belongs_to :block_members, class_name: 'Member', foreign_key: :to_id

  validates :from_id, uniqueness: { scope: :to_id }
  validates :from_id, presence: true
  validates :to_id, presence: true
end
