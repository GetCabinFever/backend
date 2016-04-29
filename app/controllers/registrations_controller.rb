class RegistrationsController < ApplicationController

  def create
    @user = User.new(first_name: params['first_name'],
                     last_name: params['last_name'],
                     email: params['email'],
                     address: params['address'],
                     city: params['city'],
                     state: params['state'],
                     zip: params['zip'],
                     phone: params['phone'],
                     dob: params['DOB'],
                     password: params['password'],
                     avatar: params['avatar'])
    @user.ensure_auth_token
    if @user.save

      # mail = UserMailer.welcome(@user)
      # mail.deliver_now

      render "create.json.jbuilder", status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params["id"])
    render 'create.json.jbuilder', status: :ok
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
        status: :ok
    else
      render json: { error: "UNAUTHORIZED" },
        status: :unauthorized
    end
  end

end
