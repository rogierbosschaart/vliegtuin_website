class ProfilePagesController < ApplicationController
  before_action :find_profile_page, only: [:show, :edit_banner, :edit_contact_info, :edit_bio, :edit_profile_images, :update, :destroy]

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit_banner
  end

  def edit_contact_info
  end

  def edit_bio
  end

  def edit_profile_images
  end

  def update
    if @profile_page.update(profile_page_params)
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
    params.require(:profile_page).permit(:naam, :banner_image, :beroep, :email, :info)
  end

  def find_profile_page
    @profile_page = ProfilePage.find(params[:id])
  end
end
