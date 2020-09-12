# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :like_members
  has_many :like_member_accounts, through: :like_members
  has_many :store_post_paths
  has_many :store_posts, through: :store_post_paths

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

  enum pref: Master::PREFECTURES

  mount_uploader :image, ImagesUploader
end
