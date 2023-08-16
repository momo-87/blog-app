# frozen_string_literal: true

# Migration to rename UserId to AuthorId in the Like table.
class RenameUserIdcolumnToAuthorIdInLikeTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :author_id
  end
end
