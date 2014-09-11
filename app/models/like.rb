class Like < ActiveRecord::Base
  attr_accessible :showcase_id, :user_id

  belongs_to :user
  belongs_to :showcase

  validates :user_id, presence: true
  validates :showcase_id, presence: true
  
end
