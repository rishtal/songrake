class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :about]

  def index
  end

  def about
  end
end
