class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :birthday ]
  # after_action :hash_position, only: [ :show, :edit]

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
  end

  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

  def edit
    @user = current_user
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def hash_position
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

  def datetime_params
    params.require(:birthday).permit(:birthdate)
  end

  def update_params
    params.require(:user).permit(:movie, :music, :book, :bio, :city, :country)
  end

  def selection_params
    params.require(:selection).permit(:birthdate, :male, :female)
  end
end

