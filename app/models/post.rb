# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :members
  validates :title, presence: true
  enum pref: Master::PREFECTURES
end
