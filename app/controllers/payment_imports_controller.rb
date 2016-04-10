class PaymentImportsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    raise params[:file]
  end

end
