class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      t.string :id
      t.belongs_to :gallery
      t.string :title
      t.string :description
      t.string :upload_date
      t.integer :likes
      t.integer :visits

      t.timestamps
    end

    add_index :showcases, :id
    add_index :showcases, :gallery_id
    add_index :showcases, [:gallery_id, :id], unique: true

  end
end
