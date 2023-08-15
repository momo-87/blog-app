class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.string :Name
      t.string :Photo
      t.text :Bio
      t.datetime :UpdatedAt
      t.datetime :CreatedAt
      t.integer :PostsCounter

      t.timestamps
    end
  end
end
