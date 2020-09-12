# frozen_string_literal: true

class StorePostPath < ApplicationRecord
  belongs_to :member
  belongs_to :store_posts, class_name: 'Post', foreign_key: "post_id"
  validates :post_id, uniqueness: { scope: :member_id }
end
