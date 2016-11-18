class UsersController < ApplicationController
  def picture
    current_user.photo = picture_params[:photo]
    current_user.save
    redirect_to profile_path(current_user)
  end

  private

  def picture_params
    params.require(:user).permit(:photo)
  end
end
