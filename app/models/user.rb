class User < ActiveRecord::Base
	
  has_many :posts
	attr_reader :password
  mount_uploader :image_url, AvatarUploader


	def password=(unencrypted_password)
    unless unencrypted_password.empty?
    	@password = unencrypted_password
    	self.password_digest = BCrypt::Password.create(unencrypted_password)
 	  end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end

  #we are establishing validation requirement for users when they are signing in
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }

 
  
end
