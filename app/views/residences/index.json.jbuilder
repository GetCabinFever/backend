# json.(@residences) do |residence|
#   json.id residence.id
#   json.image residence.image.url
#   json.residence residence, :title_of_page, :user_id, :contact_host_email, :booking_url, :check_in, :check_out, :address, :city, :state, :zip, :property_type,
#                             :accommodates, :bedrooms, :bathrooms, :beds, :description_of_listing, :house_rules, :the_space, :the_area, :interaction_with_guests,
#                             :other_things_to_note, :base_price
#   json.amenities residence.amenities
#   json.safety residence.safeties
#   json.guest_book residence.guest_books
# end

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
