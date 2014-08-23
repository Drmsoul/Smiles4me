class Showcase < ActiveRecord::Base
  attr_accessible :description, :id, :likes, :canvas, :upload_date, :visits


has_many :comments

belongs_to :gallery


  has_attached_file :canvas, :styles => { 
  	  :thumb => "150x150>",
      :square => ["400x400#", :png],
      :medium => "700x700>"
      }, 
  					:default_url => "/assets/images/:style/noimage.png"

   # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :canvas, :content_type => /\Aimage\/.*\Z/


end
