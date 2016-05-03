class RegistrationsController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.ensure_auth_token

    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      render "create.json.jbuilder", status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by!(email: params["email"])

    if @user && @user.authenticate(params["password"])
      render json: { user: @user.as_json(only: [:email, :auth_token]) },
          status: :ok
    else
      render json: { message: "INVALID EMAIL OR PASSWORD."},
          status: :unauthorized
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :address, :city,
                  :state, :zip, :phone, :dob, :password, :avatar)
  end
end
