# frozen_string_literal: true

class Like < ApplicationRecord
  validates :member_id, uniqueness: { scope: %i[account_id account_type] }
end
