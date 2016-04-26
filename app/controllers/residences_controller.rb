class ResidencesController < ApplicationController
  # before_action :authenticate!, only: [:check_auth]

  def create
    @residence = Residence.new(residence_params)
    if @residence.save
      render 'create.json.jbuilder',
      status: :success
    else
      render json: { errors: @residence.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def index
    @residences = Residence.all
    render 'index.jbuilder.json'
  end

  def show
    @residence = Residence.find(params['id'])
    render 'show.jbuilder.json'
  end

  private
  def residence_params
    params.permit(:title_of_page, :address, :city, :state, :zip, :property_type, :contact_host_email, :base_price,
    :bedrooms, :bathrooms, :beds, :description_of_listing, :house_rules, :the_space, :guest_access,
    :interaction_with_guests, :the_area, :other_things_to_note, :check_in, :check_out, :image)
  end
end
