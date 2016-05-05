class Conversations::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:index, :show, :new, :create]

  def index
  end

  def new
  end

  def create
    @message = @conversation.messages.build(message_params)

    # Manually set the fields used for processing SMSs later
    @message.update(to: @conversation.technician.phone_number, status: 'pending', direction: 'outbound-api')

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversation_messages_path(@conversation), notice: 'Something went wrong. Please try again'
    end
  end

  def show
  end

  private
    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
