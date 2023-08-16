class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  attr_accessor :comments_counter
  attr_accessor :likes_counter

  belongs_to :user, foreign_key: true
end