class BirthdaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    session[:datetime] = datetime_params
    redirect_to new_user_registration_path
  end

  private

  def datetime_params
    params.require(:birthday).permit(:birthdate, :birthtime)
  end
end
