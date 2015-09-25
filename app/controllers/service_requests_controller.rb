class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @service_requests = ServiceRequest.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @service_request.update(service_request_params)
      redirect_to @service_request, notice: "This request has been updated"
    else
      render 'edit'
    end
  end

  def new
    @service_request = ServiceRequest.new
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.status = "open"
    if @service_request.save
      redirect_to @service_request, notice: "Service Request has been submitted!"
    else
      render 'new'
    end
  end

  def destroy
    @service_request.destroy
    redirect_to service_requests_path, notice: "That request has been destroyed!"
  end

  private
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    def service_request_params
      params.require(:service_request).permit(:customer_name, :customer_phone, :customer_email, :address, :apartment, :city, :zipcode, :description, :status)
    end
end
