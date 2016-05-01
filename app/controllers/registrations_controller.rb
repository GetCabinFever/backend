class RegistrationsController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.ensure_auth_token
    if @user.save
      mail = UserMailer.welcome_email(@user)
      mail.deliver_now
      render "create.json.jbuilder", status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params["id"])
    render 'create.json.jbuilder', status: :accepted
  end

  def update
    right_now = DateTime.now
    @user = User.find_by!(email: params["email"])
    if current_user.id == user.id
      @user.update(user_params)
      @post.updated_at = right_now
      render "create.json.jbuilder", status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unauthorized
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

  def destroy
    @user = User.find_by(username: params["username"])
    if @user.authenticate(params["password"])
      @user.destroy
        render plain: "USER DESTROYED",
        status: :accepted
    else
      render json: { error: "UNAUTHORIZED" },
        status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :city,
                                 :state, :zip, :phone, :dob, :password, :avatar)
  end
end
