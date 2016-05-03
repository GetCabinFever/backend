class UsersController < ApplicationController
  before_action :authenticate!

  def check_auth
    if current_user
      render json: { message: "Current User: #{current_user.email}" },
                     status: :ok
    else
      render json: { message: 'Authorization error' },
                     status: :unauthorized
    end
  end

  def dashboard
    render "registrations/dashboard.json.jbuilder", status: :ok
  end

  def update
    @user = User.find_by!(email: params["email"])
    
    if @current_user.id == @user.id
      @user.update(user_params)
      @post.updated_at = right_now
      render "create.json.jbuilder", status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unauthorized
    end
  end

  def destroy
    @user = User.find_by(params['id'])

    if @user.authenticate(params["password"])
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
