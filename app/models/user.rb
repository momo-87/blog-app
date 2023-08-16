class User < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  attr_accessor :posts_counter

  has_many :posts, foreign_key: 'author_id'

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

end