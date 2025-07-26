class PagesController < ApplicationController

  def home
    @about = About.first
    @events = Event.first(3)
    @profile_pages = ProfilePage.where(active: true).order(updated_at: :desc)
    @news = NewsItem.find_by(selected: true)
  end

  def about
    @about = About.first
    @news = NewsItem.first
  end

  def dashboard
    @my_profile_page = current_user.profile_pages.first if user_signed_in?
    @my_news = current_user.news_items
    @my_events = Event.all if user_signed_in? && current_user.admin?
    @news = NewsItem.all.order(created_at: :desc)
    @users = User.all
    @about = About.first
  end
end
