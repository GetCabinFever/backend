json.(@residences) do |residence|
  json.id residence.id
  json.image residence.image.url
  json.residence residence, :title_of_page, :user_id, :contact_host_email, :booking_url, :check_in, :check_out, :address, :city, :state, :zip, :property_type,
                            :accommodates, :bedrooms, :bathrooms, :beds, :description_of_listing, :house_rules, :the_space, :the_area, :interaction_with_guests,
                            :other_things_to_note, :base_price
  json.amenities residence.amenities
  json.safety residence.safety
  json.guest_book residence.guest_books
end
