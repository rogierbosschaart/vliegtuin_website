class NewsItemsController < ApplicationController
  before_action :find_news_item, only: [:show, :edit, :edit_news_image, :update, :destroy]

  def index
    @news_items = NewsItem.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @news_item = NewsItem.new
  end

  def edit_news_image
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to @news_item, notice: 'News item was successfully created.'
    else
      render :new, alert: 'Unable to create news item. Please try again.'
    end
  end

  def edit
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
      redirect_to news_items_path, notice: 'News item was successfully deleted.'
    else
      redirect_to @news_item, alert: 'Unable to delete news item. Please try again.'
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
