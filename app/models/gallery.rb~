class Gallery < ActiveRecord::Base
  attr_accessible :description, :id, :showcase_list
	

	has_many :showcases
	belongs_to :user

	validates :id, uniqueness: true
  	validates :password, length: { minimum: 3 }
	
	
end
