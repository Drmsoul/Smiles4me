class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      t.string :id
      t.string :description
      t.string :picture
      t.string :upload_date
      t.integer :likes
      t.integer :visits

      t.timestamps
    end
  end
end
