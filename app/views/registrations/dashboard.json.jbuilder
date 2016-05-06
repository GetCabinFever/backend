
json.array! current_user.residences do |listing|
	json.image listing.image
	json.id listing.id
	json.property_type listing.property_type
	json.title listing.title_of_page
	json.lat listing.latitude
	json.long listing.longitude
end
