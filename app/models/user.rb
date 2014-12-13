class User < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :address, :description, :title, :excel

	geocoded_by :address
	after_validation :geocode

	has_attached_file :excel
	validates_attachment :avatar, :presence => true,
		  :content_type => { :content_type => "image/jpeg" },
		    :size => { :in => 0..10.kilobytes }
end
