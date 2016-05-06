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

  def index
    # residences = Residence.all
    # @residences = residences.page(params[:page]).per(20)
    # render 'index.json.jbuilder', status: :ok

    # if params['location'].present?
    #   @residences = Residence.near params['location'] #,50 , :order => :distance
    #   render 'index.json.jbuilder', status: :ok
    # else
    #   @residences = Residence.all
    # end

    @residences = Residence.near([params[:latitude], params[:longitude]], 10)
  end

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

  private
  def residence_params
    params.permit(:title_of_page, :address, :city, :state, :zip,
                  :property_type, :contact_host_email, :base_price, :bedrooms,
                  :bathrooms, :beds, :description_of_listing, :house_rules,
                  :the_space, :guest_access, :interaction_with_guests, :the_area,
                  :other_things_to_note, :check_in, :check_out, :image, :booking_url,
                  :longitude, :latitude)
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
