# frozen_string_literal: true

class Save < ApplicationRecord
  validates :post_id, uniqueness: { scope: :member_id }
end
