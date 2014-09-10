class Showcase < ActiveRecord::Base
  attr_accessible :id, :title, :gallery, :description, :likes, :canvas, :upload_date, :visits, :comments


has_many :comments, dependent: :destroy

belongs_to :gallery




  has_attached_file :canvas, :styles => { 
  	  :thumb => "100x100>",
      :square => ["160x160#", :png],
      :medium => "700x700>"
      }, 
  					:default_url => "/assets/images/:style/noimage.png"

   # Validate the attached image is image/jpg, image/png, etc
  
  default_scope -> { order('created_at DESC') }
  validates_attachment_content_type :canvas, :content_type => /\Aimage\/.*\Z/

  
  validates :gallery, presence: true

  

end
