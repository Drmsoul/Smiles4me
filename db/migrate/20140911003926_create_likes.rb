class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :showcase_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :showcase_id
    add_index :likes, [:user_id, :showcase_id], unique: true
  end
end
