class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to root_path, notice: "Profile updated successfully!"
    else
      render :edit, notice: "Failed to update profile"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar)
  end
end
