# frozen_string_literal: true

class LikeMember < Like
  belongs_to :like_member_account, class_name: 'Member', foreign_key: "account_id"
  validates :account_id, uniqueness: { scope: :member_id }
end