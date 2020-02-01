class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  has_many :rating
  ratyrate_rateable "rating"

end
