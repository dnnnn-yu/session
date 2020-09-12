# frozen_string_literal: true

class Block < ApplicationRecord
  validates :from_id, uniqueness: { scope: :to_id }
  validates :from_id, presence: true
  validates :to_id, presence: true
end
