class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :showcase
      t.string :content
      t.integer :likes

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :showcase_id
  end
end
