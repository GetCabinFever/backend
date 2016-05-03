
json.array! @listings do |listing|
	json.image listing.image
	json.city listing.city
	json.state listing.state
	json.zip listing.zip
	json.id listing.id
	json.property_type listing.property_type
	json.title listing.title_of_page
	json.accommodates listing.accommodates
	json.beds listing.beds
	json.price listing.base_price

end