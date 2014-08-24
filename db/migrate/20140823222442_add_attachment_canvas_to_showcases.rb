class AddAttachmentCanvasToShowcases < ActiveRecord::Migration
  def self.up
    change_table :showcases do |t|
      t.attachment :canvas
    end
  end

  def self.down
    remove_attachment :showcases, :canvas
  end
end
