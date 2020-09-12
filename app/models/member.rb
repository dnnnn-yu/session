# frozen_string_literal: true

class Member < ApplicationRecord
  # 記事作成機能
  has_many :posts

  # 記事保存機能
  has_many :store_post_paths
  has_many :store_posts, through: :store_post_paths

  # お気に入り機能
  has_many :likes
  has_many :like_members
  has_many :like_member_accounts, through: :like_members

  # チャット機能
  has_many :participants
  has_many :participant_rooms, through: :participants
  has_many :blocks, class_name: 'Block', foreign_key: :from_id
  has_many :block_members, through: :blocks
  has_many :talks


  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

  enum pref: Master::PREFECTURES

  mount_uploader :image, ImagesUploader
end
