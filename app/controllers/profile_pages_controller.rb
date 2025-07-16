class ProfilePagesController < ApplicationController
  def show
    @profile_page = ProfilePage.find(params[:id])
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

  def edit
    @profile_page = ProfilePage.find(params[:id])
  end

  def update
    @profile_page = ProfilePage.find(params[:id])
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
    params.require(:profile_page).permit(:naam, :beroep, :email, :info)
  end
end
