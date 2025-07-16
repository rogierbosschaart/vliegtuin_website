class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @events = Event.all
    @profile_pages = ProfilePage.all
  end

  def about
  end
end
