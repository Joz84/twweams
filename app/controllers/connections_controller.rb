class ConnectionsController < ApplicationController
  def create
    @receiver = User.find(params[:user_id])
    Connection.create(sender: @receiver, receiver: current_user)
    @connection = Connection.find_or_create_by(sender: current_user, receiver: @receiver)
    redirect_to connection_messages_path(@connection)
  end
end
