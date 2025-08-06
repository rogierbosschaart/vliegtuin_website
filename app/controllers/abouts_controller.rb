class AboutsController < ApplicationController
  before_action :find_about, only: [:edit, :edit_slogan, :edit_info, :edit_about_image, :edit_about_home_image, :edit_about_second_image, :edit_about_third_image, :update]

  def edit
  end

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

  def edit_about_third_image
  end

  def update
    if @about.update(about_params)
      respond_to do |format|
        format.html { redirect_to over_ons_path, notice: 'About section was successfully updated.' }
        format.turbo_stream
      end
    else
      render_appropriate_edit_view
    end
  end

  private

  def about_params
    params.require(:about).permit(
                    :first_info,
                    :second_info,
                    :slogan,
                    :second_slogan,
                    :third_slogan,
                    :about_home_image,
                    :about_image,
                    :about_second_image,
                    :about_third_image)
  end

  def find_about
    @about = About.first
  end

  def render_appropriate_edit_view
    if about_params.key?(:about_home_image)
      render :edit_about_home_image, status: :unprocessable_entity
    elsif about_params.key?(:about_second_image)
      render :edit_about_second_image, status: :unprocessable_entity
    elsif about_params.key?(:about_third_image)
      render :edit_about_third_image, status: :unprocessable_entity
    elsif about_params.key?(:about_image)
      render :edit_about_image, status: :unprocessable_entity
    elsif about_params.key?(:info)
      render :edit_info, status: :unprocessable_entity
    else
      render :edit_slogan, status: :unprocessable_entity
    end
  end

end
