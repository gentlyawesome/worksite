class Worksite < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :address, :description, :title

	geocoded_by :address
	after_validation :geocode
     
        validates :address, presence: true
        validates :address, length: { minimum: 10 }
        validates :address, length: { maximum: 500 }
end
