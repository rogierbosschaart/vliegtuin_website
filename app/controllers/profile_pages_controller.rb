class ProfilePagesController < ApplicationController
  before_action :find_profile_page, only: [:show, :edit_banner, :edit_contact_info, :edit_bio, :edit_profile_image, :update, :destroy, :add_images, :edit_images]

  def index
    @profile_pages = ProfilePage.where(active: true).order(updated_at: :desc)
  end

  def show
  end

  def new
    @profile_page = ProfilePage.new
  end

  def create
    @profile_page = ProfilePage.new(profile_page_params)
    @profile_page.user = current_user
    @profile_page.active = false
    if @profile_page.save
      redirect_to profile_page_path(@profile_page), notice: 'Profile page was successfully created.'
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
    # Determine which parameters to use
    params_to_update = if params[:profile_page]
                         profile_page_params
                       else
                         params.permit(:active)
                       end

    # Separate out any images to attach later
    images_to_attach = params_to_update.delete(:images) if params_to_update.is_a?(ActionController::Parameters)

    if @profile_page.update(params_to_update)
      @profile_page.images.attach(images_to_attach) if images_to_attach

      respond_to do |format|
        format.html { redirect_to @profile_page, notice: 'Profile page was successfully updated.' }
        format.turbo_stream # This will render update.turbo_stream.erb and reload the page
      end
    else
      # This block handles validation errors from your forms
      if params[:profile_page].key?(:banner_image)
        render :edit_banner, status: :unprocessable_entity
      elsif params[:profile_page].key?(:info)
        render :edit_bio, status: :unprocessable_entity
      elsif params[:profile_page].key?(:email)
        render :edit_contact_info, status: :unprocessable_entity
      elsif images_to_attach
        render :add_images, status: :unprocessable_entity
      else
        redirect_to @profile_page, alert: "Update failed."
      end
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
