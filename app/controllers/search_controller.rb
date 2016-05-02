class SearchController < ApplicationController
	
	def search
		@listings = Residence.where("city ILIKE ?", "%#{params[:search_input]}%")
													.where("state ILIKE ?", "%#{params[:search_input]}%")
													.where("zip ILIKE ?", "%#{params[:search_input]}%")
													.where("property_type ILIKE ?", "%#{params[:property_type]}%")
		render "search.json.jbuilder", status: :ok
	end
end 