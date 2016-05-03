class Conversations::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:index, :show, :new, :create]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  private
    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end
end
