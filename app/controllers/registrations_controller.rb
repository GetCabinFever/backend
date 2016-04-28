class RegistrationsController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.ensure_auth_token
    if @user.save
      mail = UserMailer.welcome(@user)
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
    @user = User.find(params["id"])
    @user.update(username: params["title"],
                email: params["email"],
                address: params['address'],
                city: params['city'],
                state: params['state'],
                zip: params['zip'],
                phone: params['phone'],
                dob: params['DOB'],
                password: params["password"])

    @post.updated_at = right_now
    render "create.json.jbuilder", status: :ok
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

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :address, :city,
                  :state, :zip, :phone, :dob, :password, :avatar)
  end
end
