class SearchController < ApplicationController

	# def search
	# 	query = "city ILIKE ? OR state ILIKE ? OR zip ILIKE ?"
	# 	like_term = "%#{params[:search_input]}%"
	# 	@listings = Residence.where(query, like_term, like_term, like_term)
	# 												.where("property_type ILIKE ?", "%#{params[:property_type]}%")
	# 	render "search.json.jbuilder", status: :ok
	# end

	# def search
	# 	if params['location'].blank?
	# 		@location_query = [location.latitude, location.latitude]
	# 		@geo_address = request.location.geo_address
	# 	else
	# 		@location_query = params['location']
	# 		@geo_address = params['geo_address']
	# 	end
	# 	@residences = Residence.near(@location_query, 500)
	# 	@residences = @residences.to_a.slice(0,entries).shuffle
	# end
end
 
