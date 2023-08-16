class User < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  attr_accessor :posts_counter

  has_many :posts
end