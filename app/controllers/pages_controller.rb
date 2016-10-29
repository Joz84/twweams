class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :birthday ]

  def birthday
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    # hour = datetime_params["birthtime(4i)"].to_i
    # minute = datetime_params["birthtime(5i)"].to_i
    session[:birthday] = DateTime.new(year, month, day, 0, 0, 0, "+00:00")
    redirect_to new_user_registration_path
  end

  def home
  end

  def first_selection
    session[:selection] = []
    session[:selection][:birthday] = current_user.birthday
    session[:selection][:max_length] = 20000
  end

  def selection
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    session[:selection][:birthday] = DateTime.new(year, month, day, 0, 0, 0, "+00:00")
    session[:selection][:max_length] = datetime_params["birthdate(1i)"].to_i
  end

  def dashboard
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    @users = User.where(birthday: current_user.birthday)
    # year = current_user.birthday.year
    # month = current_user.birthday.month
    # day = current_user.birthday.day
    # date_min = DateTime.new(year, month, day)
    # date_max = DateTime.new(year, month, day + 1)
    # all_users = User.where.not(latitude: nil, longitude: nil) #AJOUTER CRITERE DE BIRTHDAY
    # @users = all_users.select { |user| user.birthday >= date_min && user.birthday <= date_max }
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate)#, :birthtime)
  end

  def poubelle
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end
end

