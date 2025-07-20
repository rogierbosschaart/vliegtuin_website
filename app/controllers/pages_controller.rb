class PagesController < ApplicationController

  def home
    @about = About.all
    @events = Event.where("date >= ?", Date.today).order(date: :asc).first(3)
    @profile_pages = ProfilePage.all.order(updated_at: :desc)
  end

  def about
    @about = About.all
  end
end
