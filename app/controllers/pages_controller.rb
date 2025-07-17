class PagesController < ApplicationController

  def home
    @events = Event.all
    @profile_pages = ProfilePage.all.order(updated_at: :desc)
  end

  def about
  end
end
