# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleeps
  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :follower_users, foreign_key: :followed_id, class_name: "Follow"
  has_many :followed, through: :followed_users, source: :followed
  has_many :followers, through: :follower_users, source: :follower

  validates :name, presence: true
end
