class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :user
      t.string :id
      t.string :description
      t.timestamps
    end

    add_index :galleries, :id
    add_index :galleries, :user_id
  end
end
