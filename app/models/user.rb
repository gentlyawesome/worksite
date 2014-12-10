class User < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :address, :description, :title

	geocoded_by :address
	after_validation :geocode
end
