class AboutsController < ApplicationController
  before_action :find_about, only: [:edit_slogan, :edit_info, :edit_about_image, :edit_about_home_image, :edit_about_second_image, :update]

  def edit_slogan
  end

  def edit_info
  end

  def edit_about_image
  end

  def edit_about_home_image
  end

  def edit_about_second_image
  end

  def update
    if @about.update(about_params)
      respond_to do |format|
        format.html { redirect_to over_ons_path, notice: 'About section was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit_about_home_image, status: :unprocessable_entity
    end
  end

  private

  def about_params
    params.require(:about).permit(
                    :info,
                    :slogan,
                    :about_image,
                    :about_second_image,
                    :about_home_image)
  end

  def find_about
    @about = About.find(params[:id])
  end
end
