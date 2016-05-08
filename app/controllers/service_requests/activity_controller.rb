class ServiceRequests::ActivityController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_request, only: [:new, :create]

  def new
  end

  def create
  end

  private
    def set_service_request
      @service_request = ServiceRequest.find(params[:service_request_id])
    end
end
