class UsersController < ApplicationController
  before_action :authenticate!, only: [:check_auth]

  def check_auth
    if current_user
      render json: { message: "Current User: #{current_user.email}" },
                     status: :ok
    else
      render json: { message: 'Authorization error' },
                     status: :unauthorized
    end
  end
end
