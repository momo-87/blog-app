# frozen_string_literal: true

# Migration to create the Like table.
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
