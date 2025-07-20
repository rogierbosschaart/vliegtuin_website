class ProfilePagesController < ApplicationController
  before_action :find_profile_page, only: [:show, :edit_banner, :edit_contact_info, :edit_bio, :edit_profile_image, :update, :destroy, :add_images, :edit_images]

  def show
  end

  def new
    @profile_page = ProfilePage.new
  end

  def create
    @profile_page = ProfilePage.new(profile_page_params)
    @profile_page.user = current_user
    if @profile_page.save
      redirect_to root_path, notice: 'Profile page was successfully created.'
    else
      redirect_to root_path, notice: 'Unable to create profile page. Please try again.'
    end
  end

  def edit_banner
  end

  def edit_contact_info
  end

  def edit_bio
  end

  def add_images
  end

  def edit_images
  end

  def destroy_image
    @profile_page = ProfilePage.find(params[:profile_page_id])
    @image = @profile_page.images.find(params[:id])
    if @image.purge_later
      redirect_to @profile_page, notice: "Image was successfully deleted."
    else
      redirect_to @profile_page, alert: "Failed to delete image."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to @profile_page, alert: "Image not found."
  end

  def edit_profile_image
  end

  def update
    permitted_params = profile_page_params
    images_to_attach = permitted_params.delete(:images)

    if @profile_page.update(permitted_params)
      @profile_page.images.attach(images_to_attach) if images_to_attach
      redirect_to profile_page_path(@profile_page), notice: 'Profile page was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile_page = ProfilePage.find(params[:id])
    @profile_page.destroy
    redirect_to root_path, notice: 'Profile page was successfully deleted.'
  end

  private
  def profile_page_params
    params.require(:profile_page).permit(
                                :naam,
                                :beroep,
                                :info,
                                :profile_image,
                                :banner_image,
                                :email,
                                :website,
                                :phone_number,
                                :facebook,
                                :instagram,
                                :linkedin,
                                :pinterest,
                                images: []
                              )
  end

  def find_profile_page
    @profile_page = ProfilePage.find(params[:id] || params[:profile_page_id])
  end
end
