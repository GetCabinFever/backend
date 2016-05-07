class SearchController < ApplicationController

	# def search
	# 	query = "city ILIKE ? OR state ILIKE ? OR zip ILIKE ?"
	# 	like_term = "%#{params[:search_input]}%"
	# 	@listings = Residence.where(query, like_term, like_term, like_term)
	# 												.where("property_type ILIKE ?", "%#{params[:property_type]}%")
	# 	render "search.json.jbuilder", status: :ok
	# end
end 
