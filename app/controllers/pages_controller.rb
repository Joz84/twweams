class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :birthday ]

  def birthday
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    session[:birthday] = DateTime.new(year, month, day, 0, 0, 0, "+00:00")
    session[:length] = 20000
    redirect_to new_user_registration_path
  end

  def home
  end

  def selection
    year = selection_params["birthdate(1i)"].to_i
    month = selection_params["birthdate(2i)"].to_i
    day = selection_params["birthdate(3i)"].to_i
    session[:birthday] = DateTime.new(year, month, day, 0, 0, 0, "+00:00")
    session[:length] = selection_params[:max_length].to_i
    redirect_to root_path
  end

  def dashboard
    @birthday = DateTime.parse(session[:birthday])
    @length = session[:length]
    @users = User.where(birthday: @birthday)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate)
  end

  def selection_params
    params.require(:selection).permit(:birthdate, :length, :gender)
  end

  def poubelle
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end
end

