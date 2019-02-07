class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
    @newuser = User.new
    @user = User.find_by(name: params[:u])
  end

  def create
      @message = Message.new(message_params)
        if @message.user.password == @message.password
          @message.save
          @user = @message.user
          redirect_to messages_path + "?u=#{@user.name}"
        else
          redirect_to messages_path
        end
  end


  private

  def message_params
    params.require(:message).permit(:content, :user_id, :password)
  end

end
