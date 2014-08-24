class User < ActiveRecord::Base
  attr_accessible :id, :username,:password_confirmation,:password,:crypted_password, :email, :salt, :avatar, :gallery
 
  after_create :make_gallery

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
      :square => ["30x30#", :png],
      :medium => "300x300"
      }, 
  					:default_url => "/assets/images/:style/noimage.png"

   # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def make_gallery
      create_gallery(:description => "My Gallery")
  end


  def following?(other_user)
    relationships.where(followed_id: other_user.id).exists?
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.where(followed_id: other_user.id).last.destroy
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
