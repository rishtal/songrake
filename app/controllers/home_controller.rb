class HomeController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [:index, :about]
  skip_before_filter :authenticate_admin, :only => [:index, :about]

  def index
  end

  def about
  end
end
