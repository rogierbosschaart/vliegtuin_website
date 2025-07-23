class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def invite
    User.invite!(invite_params, current_user)
    redirect_to dashboard_path, notice: "Invitation sent to #{params[:user][:email]}."
  end

  private

  def invite_params
    params.require(:user).permit(:email)
  end

  def ensure_admin!
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.admin?
  end
end
