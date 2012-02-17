class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location
  before_filter :authenticate_user!


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_profile_path(current_user)
  end

  def store_location
    if params[:controller] == "playlists" && params[:action] == "join"
      session[:user_return_to] = playlist_path(params[:playlist_id])
    end
  end
end
