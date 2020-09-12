# frozen_string_literal: true

class LikeMember < Like
  belongs_to :like_member_accounts, class_name: 'Member', foreign_key: "account_id"
  validates :member_id, uniqueness: { scope: :account_id }
end