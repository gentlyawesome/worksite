class User < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :address, :description, :title, :excel

	geocoded_by :address
	after_validation :geocode

	has_attached_file :excel
     
        validates :address, presence: true
        validates :address, length: { minimum: 10 }
        validates :address, length: { maximum: 500 }
end
