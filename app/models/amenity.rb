class Amenity < ActiveRecord::Base
	# has_one :residence
	belongs_to :residence
end
