# frozen_string_literal: true

class Member < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

  enum pref: Master::PREFECTURES

  mount_uploader :image, ImagesUploader
end
