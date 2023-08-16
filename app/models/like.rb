class Like < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :post, foreign_key: true
end