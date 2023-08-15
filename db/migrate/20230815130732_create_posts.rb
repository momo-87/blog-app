class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.references :authorId, null: false, foreign_key: { to_table: :users }
      t.string :Title
      t.text :Text
      t.datetime :CreatedAt
      t.datetime :UpdatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
