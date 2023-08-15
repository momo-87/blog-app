class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :UserId, null: false, foreign_key: { to_table: :User }
      t.references :PostId, null: false, foreign_key: { to_table: :Post }
      t.text :Text
      t.datetime :UpdatedAt
      t.datetime :CreatedAt

      t.timestamps
    end
  end
end
