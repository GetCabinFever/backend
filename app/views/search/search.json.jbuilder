json.listings @listings do |listing|
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
	json.lat listing.latitude
	json.long listing.longitude
	
end

if @places
  json.nearby @places do |place|
  	json.image place.image
  	json.city place.city
  	json.state place.state
  	json.zip place.zip
  	json.id place.id
  	json.property_type place.property_type
  	json.title place.title_of_page
  	json.accommodates place.accommodates
  	json.beds place.beds
  	json.price place.base_price
  	json.lat place.latitude
  	json.long place.longitude
  	
  end
end
