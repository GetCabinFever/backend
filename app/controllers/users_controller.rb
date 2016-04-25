class UsersController < ApplicationController
  before_action :authenticate!, only: [:check_auth]

  def create
    @user = User.new user_params
    @user.ensure_auth_token
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def check_auth
    if current_user
      render json: { message: "Current User: #{current_user.email}" },
                     status: ok
    else
      render json: { message: 'Authorization error' },
                     status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :password, :email, :address, :city, :state, :zip, :phone, :dob)
end
