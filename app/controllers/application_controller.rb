class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    token = request.headers['X-Auth-Token']
    if token
      @current_user ||= User.find_by auth_token: token
    end
  end

  def authenticate!
    unless current_user
      render json: { errors: 'Please log in first' },
                     status: :unauthorized
    end
  end

  def location
  if params[:location].blank?
    if Rails.env.test? || Rails.env.development?
      @location ||= Geocoder.search("50.78.167.161").first
    else
      @location ||= request.location
    end
  else
    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
    @location ||= Geocoder.search(params[:location]).first
    @location
  end
end
end
