class Comment < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post
  validates_presence_of :text

  after_save :update_comments_counter_for_a_post

  private
  
  def update_comments_counter_for_a_post
    post.update(comments_counter: post.comments.count)
  end
end
