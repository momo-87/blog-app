class Like < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post

  after_save :update_likes_counter_for_a_post

  private

  def update_likes_counter_for_a_post
    post.update(likes_counter: post.likes.count)
  end
end
