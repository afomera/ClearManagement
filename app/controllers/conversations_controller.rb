class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.conversations.includes(:technician).all
  end

  def show
    @conversation = current_user.conversations.find(params[:id])
  end
end
