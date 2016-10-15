class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :datetime ]

  def home
    @birthday = Birthday.new
  end

end
