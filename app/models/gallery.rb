class Gallery < ActiveRecord::Base
  attr_accessible :description, :id , :user
	

	has_many :showcases, dependent: :destroy
	belongs_to :user

	validates :id, uniqueness: true
	
  	

  	def add_showcase(new_showcase)
  		create_showcase(:description => new_showcase.description , :likes => new_showcase.likes, :visits => new_showcase.visits , :canvas => new_showcase.canvas, :upload_date => new_showcase.upload_date )
  	end

	def find_showcase(showcase_to_find)
		showcases.where(gallery: showcase_to_find.gallery)
	end


	
end
