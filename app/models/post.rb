class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  attr_accessor :comments_counter
  attr_accessor :likes_counter

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
end