class SearchController < ApplicationController
	
	def search
		@listing = Residence.where("city ILIKE ?", "%#{params[:city]}%", 
																state: params["state"])
		render :card_search
	end
end 