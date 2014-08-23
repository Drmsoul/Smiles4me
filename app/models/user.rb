class User < ActiveRecord::Base
  attr_accessible :username,:password_confirmation,:password,:crypted_password, :email, :salt, :avatar

  authenticates_with_sorcery!

    

  has_many :comments
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy

  has_many :followers, through: :reverse_relationships, source: :follower


 
  has_one :gallery
  
  validates :username, length: { minimum: 4 }
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, :styles => { 
  	  :thumb => "150x150>",
      :square => ["100x100#", :png],
      :medium => "300x300"
      }, 
  					:default_url => "/assets/images/:style/noimage.png"

   # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end


end
