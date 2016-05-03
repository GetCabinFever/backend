class UsersController < ApplicationController

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
end
