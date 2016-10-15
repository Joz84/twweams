class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :datetime ]

  def home
    @birthday = Birthday.new
  end

  def dashboard

    @users = User.where.not(latitude: nil, longitude: nil) #AJOUTER CRITERE DE BIRTHDAY

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { user: user })
    end
  end

end
