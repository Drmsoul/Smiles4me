class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :showcase
  attr_accessible :content, :likes


	
  	validates :content, length: { minimum: 1 }


end
