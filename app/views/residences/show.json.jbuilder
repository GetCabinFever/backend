json.owner @residence.user, :first_name, :last_name

json.residence @residence, :title_of_page, :user_id, :address, :city, :state, :zip, :property_type, :contact_host_email, :base_price, :accommodates,
                           :bedrooms, :bathrooms, :beds, :description_of_listing, :house_rules, :the_space, :guest_access,
                           :interaction_with_guests, :the_area, :other_things_to_note, :check_in, :check_out, :id, :booking_url

json.amenities @residence.amenities, :kitchen, :internet, :tv, :essentials, :shower_essentials, :heating, :airconditioning, :washer,
                                     :dryer, :dishwasher, :free_parking, :cable, :satellite, :breakfast, :pets, :kid_friendly, :events,
                                     :smoking, :wheelchair_accessible, :elevator, :fireplace, :intercom, :doorman, :pool, :hottub, :gym,
                                     :hangers, :iron, :hair_dryer, :workstation, :billiards

json.safeties @residence.safety, :smoke, :co2, :first_aid, :safety_card, :extinguisher, :fire_alarm, :gas_shutoff, :generator

json.avatar_url @residence.user.avatar.url
json.image_url @residence.image.url

