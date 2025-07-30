class NewsItemsController < ApplicationController
  before_action :find_news_item, only: [:show, :edit, :edit_news_image, :update, :destroy]

  def index
    @selected_news = NewsItem.find_by(selected: true)
    @news_items = NewsItem.where.not(id: @selected_news&.id).order(created_at: :desc)
  end

  def show
    news_p = @news_item.info.split(/\n|\s*\n/)
    if news_p.length >= 4
      @news_first_p = news_p.first(2).join("\n\n")
      @news_rest_p = news_p[2..].join("\n\n")
    else
      @news_first_p = news_p.first
      @news_rest_p = news_p[1..].join("\n\n")
    end
  end

  def new
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    @news_item.user = current_user
    if @news_item.save
      redirect_to @news_item, notice: 'News item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def edit_news_image
  end

  def toggle_selected
    @all_news = NewsItem.all
    @all_news.update_all(selected: false)
    @news = NewsItem.find(params[:id])
    @news.toggle!(:selected)
    redirect_to dashboard_path, notice: "#{@news.title} has been selected for the home page."
  end

  def update
    if @news_item.update(news_item_params)
      respond_to do |format|
        format.html { redirect_to news_items_path, notice: 'News item was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit, alert: 'Unable to update news item. Please try again.'
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    if @news_item.destroy
      redirect_to dashboard_path, notice: 'News item was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'Unable to delete news item. Please try again.'
    end
  end

  private

  def find_news_item
    @news_item = NewsItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to news_items_path, alert: 'News item not found.'
  end

  def news_item_params
    params.require(:news_item).permit(:title, :info, :slogan, :news_item_image, :selected)
  end
end
