class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!, only: [:invite, :toggle_admin]

  def invite
    User.invite!(invite_params, current_user)
    redirect_to dashboard_path, notice: "Invitation sent to #{params[:user][:email]}."
  end

  def toggle_admin
    @user = User.find(params[:id])
    # .toggle! is a handy Rails method that flips a boolean and saves the record.
    @user.toggle!(:admin)

    redirect_to dashboard_path, notice: "#{@user.naam}'s admin status has been updated."
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "#{@user.naam}'s profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:naam, :email, :admin)
  end

  def invite_params
    params.require(:user).permit(:email)
  end

  def ensure_admin!
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.admin?
  end
end
