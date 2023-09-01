class Comment < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_comments_counter_for_a_post
  after_destroy :update_comments_counter_for_a_post

  private

  def update_comments_counter_for_a_post
    post.update(comments_counter: post.comments.count)
  end
end
