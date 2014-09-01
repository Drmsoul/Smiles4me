class Comment < ActiveRecord::Base
 attr_accessible :content, :likes, :user, :showcase, :showcase_id

  belongs_to :user
  belongs_to :showcase
  
  


	
  	validates :content, length: { minimum: 1 }


end
