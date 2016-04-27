class ResidencesController < ApplicationController
  before_action :authenticate!, only: [:create]

  def create
    @residence = current_user.residences.new(residence_params)
    @residence.amenities = Amenities.new(amenities_params)
    @residence.safety = Safety.new(safeties_params)
    if @residence.save
      render 'create.json.jbuilder',
      status: :ok
    else
      render json: { errors: @residence.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def index
    @residences = Residence.all
    render 'index.json.jbuilder'
    status: :ok
  end

  def show
    @residence = Residence.find(id: params['id'])
    render 'show.json.jbuilder'
    status: :ok
  end

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
