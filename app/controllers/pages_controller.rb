class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :datetime ]

  def home
    @birthday = Birthday.new
  end

  def dashboard
    year = current_user.birthday.year
    month = current_user.birthday.month
    day = current_user.birthday.day
    date_min = DateTime.new(year, month, day)
    date_max = DateTime.new(year, month, day + 1)
    all_users = User.where.not(latitude: nil, longitude: nil) #AJOUTER CRITERE DE BIRTHDAY
    @users = all_users.select { |user| user.birthday >= date_min && user.birthday <= date_max }
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

end
