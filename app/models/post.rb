class Post < ApplicationRecord
  validates :title, presence: true,
  validates :text, presence: true,
  attr_accessor :comments_counter
  attr_accessor :likes_counter

  belongs_to :users, foreign_key: :user_id
end