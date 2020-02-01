class Prefecture < ApplicationRecord
	mount_uploader :picture, PictureUploader
	has_many :hotels
end
