class BirthdaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    hour = datetime_params["birthtime(4i)"].to_i
    minute = datetime_params["birthtime(5i)"].to_i
    session[:birthday] = DateTime.new(year, month, day, hour, minute, 0, "+00:00")
    redirect_to new_user_registration_path
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate, :birthtime)
  end
end
