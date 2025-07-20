class AboutsController < ApplicationController
  before_action :find_about, only: [:edit_slogan, :edit_info, :edit_about_image, :update]

  def edit_slogan
  end

  def edit_info
  end

  def edit_about_image
  end

  def update
    @about = About.find(params[:id])
    if @about.update(about_params)
      redirect_to root_path, notice: 'About was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def about_params
    params.require(:about).permit(:info, :slogan, :about_image)
  end

  def find_about
    @about = About.find(params[:id])
  end
end
