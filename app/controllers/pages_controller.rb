class PagesController < ApplicationController

  def home
    @about = About.first
    @events = Event.where("date >= ?", Date.today).order(date: :asc).first(3)
    @profile_pages = ProfilePage.all.order(updated_at: :desc)
    @news = NewsItem.first
  end

  def about
    @about = About.first
    @news = NewsItem.first
  end
end
