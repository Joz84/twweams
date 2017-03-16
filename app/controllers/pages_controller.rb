class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :birthday ]

  def birthday
    session[:birthday] = User.birthdate(datetime_params)
    redirect_to new_user_registration_path
  end

  def home
  end

  def selection
    session[:birthday] = User.birthdate(selection_params)
    session[:length] = params[:length].to_i
    session[:male] = selection_params[:male]
    session[:female] = selection_params[:female]
    redirect_to root_path
  end

  def dashboard
    @birthday = session[:birthday] ? DateTime.parse(session[:birthday]) : current_user.birthday
    @length = session[:length] ? session[:length] : 100
    @users = current_user.selected_users(@birthday, session[:male].to_i, session[:female].to_i, @length)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate)
  end

  def selection_params
    params.require(:selection).permit(:birthdate, :male, :female)
  end
end

