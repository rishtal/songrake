class SongRakeController < ApplicationController
  before_filter :authenticate_admin

  #--------------------------------
  protected

  def authenticate_admin
    if !user_signed_in?
      redirect_to root_path, notice: "There is no user signed in"
    elsif current_user.role != "Admin"
      redirect_to root_path, notice: "You don't have access to that page."
    end
  end

end
