class ServiceRequestsController < ApplicationController
  before_action :set_service_request, except: [:index, :new, :create]
  before_action :authenticate_user!
  def index
    @service_requests = ServiceRequest.order("created_at DESC")
  end

  def open
    @service_requests = ServiceRequest.status("open").order("created_at DESC")
    render action: :index
  end

  def in_progress
    @service_requests = ServiceRequest.status("in_progress").order("created_at DESC")
    render action: :index
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

  def close
    #@service_request.status = "closed"
    if @service_request.update_attribute(:status, "closed")
      redirect_to @service_request, notice: "Closed service request ##{@service_request.id}"
    else
      redirect_to @service_request, notice: "An error occurred"
    end
  end

  def reopen
    if @service_request.update_attribute(:status, "open")
      redirect_to @service_request, notice: "Re-opened service request ##{@service_request.id}"
    else
      redirect_to @service_request, notice: "An error occurred"
    end
  end

  def make_inprogress
    if @service_request.update_attribute(:status, "in_progress")
      redirect_to @service_request, notice: "Marked service request ##{@service_request.id} as in-progress"
    else
      redirect_to @service_request, notice: "An error occurred"
    end
  end

  private
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    def service_request_params
      params.require(:service_request).permit(:customer_name, :customer_phone, :customer_email, :address, :apartment, :city, :state, :zipcode, :description, :status)
    end
end
