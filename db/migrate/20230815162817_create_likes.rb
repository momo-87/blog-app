class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.references :UserId, null: false, foreign_key: { to_table: :User }
      t.references :PostId, null: false, foreign_key: { to_table: :Post }
      t.datetime :CreatedAt
      t.datetime :UpdatedAt

      t.timestamps
    end
  end
end
