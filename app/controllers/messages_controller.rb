class MessagesController < ApplicationController
  def index
    @connection = Connection.find(params[:connection_id])
    @messages = @connection.messages.map { |message| message }.reverse
    @message = Message.new
  end

  def create
    @connection = Connection.find(params[:connection_id])
    @connection_return = Connection.find_by(sender: @connection.receiver, receiver: @connection.sender)
    @message = Message.create(user: current_user, content: messages_params[:content], connection: @connection )
    @message = Message.create(user: current_user, content: messages_params[:content], connection: @connection_return )
    redirect_to connection_messages_path([@connection])
  end

  def destroy
    @message = Message.find(params[:id])
    @connection = @message.connection
    @message.destroy
    redirect_to connection_messages_path(@connection)
  end

  def messages_params
    params.require(:message).permit(:content)
  end

end
