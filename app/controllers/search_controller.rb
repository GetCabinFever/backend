class SearchController < ApplicationController
	
	def search
		@listings = Residence.where("city ILIKE ?", "%#{params[:city]}%")
													.where("state ILIKE ?", "%#{params[:state]}%")
													.where("zip ILIKE ?", "%#{params[:zip]}%")
													.where("property_type ILIKE ?", "%#{params[:property_type]}%")
		render "search.json.jbuilder", status: :ok
	end
end 