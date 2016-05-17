class ResidencesController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :delete]

  def create
    @residence = current_user.residences.new(residence_params)
    @residence.amenities = Amenity.new(amenities_params)
    @residence.safeties = Safety.new(safeties_params)
    if @residence.save
      UserMailer.new_listing_email(current_user).deliver_now
      render 'create.json.jbuilder', status: :ok
    else
      render json: { errors: @residence.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def upload
    # [25] pry(main)> Rubillow::PropertyDetails.deep_comps({zws_id: 'X1-ZWz1f9t19ndb7v_5886x',zpid: 2106042741,count: 25})
    binding.pry  
    properties = Rubillow::PropertyDetails.deep_comps
      {
        zws_id: params['zws-id'],
        zpid: params['zpid'],
        count: params['count']
      }
    # render : { properties: @properties }, status: :ok
  end

  # def index
  #   query = "city ILIKE ? OR state ILIKE ? OR zip ILIKE ?"
	# 	like_term = "%#{params[:search_input]}%"
	# 	@listings = Residence.where(query, like_term, like_term, like_term)
	# 										   .where("property_type ILIKE ?", "%#{params[:property_type]}%")
	# 	# if @listings.count > 0
	# 	# 	residence = @listings.first
	# 	# 	@places = Residence.near(residence.latitude, residence.longitude, 50)
	# 	# end
  #   render "index.json.jbuilder", status: :ok
  # end

  def show
    @residence = Residence.find(params['id'])
    render 'show.json.jbuilder', status: :ok
  end

  def update
    @residence = Residence.find params['id']
    if current_user.id == @residence.user_id
      @residence.update residence_params
      render 'show.json.jbuilder', status: :ok
    else
      render json: { error: "INVALID PERMISSION" },
                     status: :unauthorized
    end
  end

  def destroy
    @residence = Residence.find(params['id'])
    if current_user.id == @residence.user_id
      @residence.destroy
      render json: { message: "LISTING DESTROYED"} ,
                     status: :ok
    else
      render json: { error: "INVALID PERMISSION" },
                     status: :unauthorized
    end
  end

  # def upload
  #   binding.pry
  #   @zillow = ZillowScraper.new
  #   results = []
  #   zillow_ids = @zillow.zillow_scrape params['query']
  #   zillow_ids.each do |id|
  #     results << Residence.import_from_zillow id
  #   end
  #   results.map {|x| x.save}
  # end

  private
  def residence_params
    params.permit(:title_of_page, :address, :city, :state, :zip,
                  :property_type, :contact_host_email, :base_price, :bedrooms,
                  :bathrooms, :beds, :description_of_listing, :house_rules,
                  :the_space, :guest_access, :interaction_with_guests, :the_area,
                  :other_things_to_note, :check_in, :check_out, :image, :booking_url)
  end

  def amenities_params
    params.permit(:kitchen, :internet, :tv, :essentials, :shower_essentials,
                  :heating, :airconditioning, :washer, :dryer, :dishwasher,
                  :free_parking, :cable, :satellite, :breakfast, :pets,
                  :kid_friendly, :events, :smoking, :wheelchair_accessible,
                  :elevator, :fireplace, :intercom, :doorman, :pool, :hottub,
                  :gym, :hangers, :iron, :hair_dryer, :workstation, :billiards)
  end

  def safeties_params
    params.permit(:smoke, :co2, :first_aid, :safety_card, :extinguisher, :fire_alarm, :gas_shutoff, :generator)
  end

end