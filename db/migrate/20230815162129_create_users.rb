# frozen_string_literal: true

# Migration to create the User table.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
