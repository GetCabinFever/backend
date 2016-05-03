class UsersController < ApplicationController

  before_action :authenticate!

  def update
    @user = User.find_by(id: params['id'])
    @user.update(user_params)
    render 'update.json.jbuilder', status: :ok
  end

  def destroy
    @user = User.find_by(id: params['id'])
    @user.destroy
    render json: { message: "#{@user.first_name}'s account successfully deleted"}
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :address, :city,
                  :state, :zip, :phone, :dob, :password, :avatar)
  end

  def dashboard
    render "registrations/dashboard.json.jbuilder", status: :ok
  end

  def update
    @user = User.find_by id: params['id']

    if @current_user.id == @user.id
      @user.update(user_params)
      render 'registrations/create.json.jbuilder', status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unauthorized
    end
  end

  def destroy
    @user = User.find_by(id: params['id'])

    if @current_user.id == @user.id
      @user.destroy
      render plain: "#{@user.first_name}'s account successfully deleted",
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unauthorized
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :address, :city,
                  :state, :zip, :phone, :dob, :password, :avatar)
  end
end
