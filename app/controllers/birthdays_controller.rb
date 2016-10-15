class BirthdaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    hour = datetime_params["birthtime(4i)"].to_i
    minute = datetime_params["birthtime(5i)"].to_i
    date = Date.new(year, month, day)
    time  = Time.new(1900, 01, 01, hour, minute, 0, "+00:00")
    birthday = Birthday.find_or_create_by(birthdate: date, birthtime: time)
    session[:birthday] = birthday
    redirect_to new_user_registration_path
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate, :birthtime)
  end
end
