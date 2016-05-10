class Conversations::MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:reply]
  before_action :set_conversation, only: [:index, :show, :new, :create]
  skip_before_action :verify_authenticity_token, only: [:reply]

  def index
  end

  def new
  end

  def create
    @message = @conversation.messages.build(message_params)

    # Manually set the fields used for processing SMSs later
    @message.update(to: @conversation.technician.phone_number, status: 'pending', direction: 'outbound-api')

    respond_to do |format|
      if @message.save
        SendSmsJob.perform_later(@message)
        format.html { redirect_to conversation_messages_path(@conversation), notice: 'Message was successfully created.' }
        format.js   {}
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to conversation_messages_path(@conversation), notice: 'Something went wrong. Please try again' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def reply
    from = params[:From].gsub(/^\+\d/, '')
    body = params[:Body]
    status = params[:SmsStatus]
    direction = 'inbound'

    # Find the conversation it should belong to.
    technician = Technician.where("phone_number like ?", "%#{from}%").first
    @conversation = Conversation.where(technician: technician).first
    @conversation.messages.build(body: body, direction: direction, status: status, from: from).save
    # the head :ok tells everything is ok
    # This stops the nasty template errors in the console
    head :ok, content_type: "text/html"
  end

  private
    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
