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
    @user = current_user
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to dashboard_path, notice: "Your account has been updated successfully."
    else
      redirect_to dashboard_path, alert: "There was an error updating your account."
    end
  end

  private

  def user_params
    params.require(:user).permit(:naam, :email, :password, :password_confirmation, :current_password)
  end

  def invite_params
    params.require(:user).permit(:email)
  end

  def ensure_admin!
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.admin?
  end
end
