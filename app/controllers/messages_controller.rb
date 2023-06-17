class MessagesController < ApplicationController
  def publish
    if logged_in?
      message = { 
        message: {
          content: message_params[:content],
          first_name: current_user.first_name,
        }
      }
      ActionCable.server.broadcast 'MessagesChannel', message
      render json: message
    else
      render json: {error: "Failed to save message."}
    end
  end

  private
  def message_params
      params.require(:message).permit(:content)
  end
end
