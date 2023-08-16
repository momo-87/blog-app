class Comment < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :post, foreign_key: true
  validates_presence_of :text
end