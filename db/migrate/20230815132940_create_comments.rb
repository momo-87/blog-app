class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :Comment do |t|
      t.references :UserId, null: false, foreign_key: { to_table: :User }
      t.references :PostId, null: false, foreign_key: { to_table: :Post }
      t.text :Text
      t.datetime :CreatedAt
      t.datetime :UpdatedAt

      t.timestamps
    end
  end
end
