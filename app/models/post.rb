class Post < ActiveRecord::Base
	belongs_to :user
	has_many :likes

	mount_uploader :image_url, PostImageUploader


end
