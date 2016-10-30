class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :birthday ]

  def birthday
    session[:birthday] = User.birthdate(datetime_params)
    session[:length] = 20000
    redirect_to new_user_registration_path
  end

  def home
  end

  def selection
    session[:birthday] = User.birthdate(selection_params)
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
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate)
  end

  def selection_params
    params.require(:selection).permit(:birthdate, :length, :gender)
  end
end

