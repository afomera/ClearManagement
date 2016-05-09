class ServiceRequests::ActivityController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_request, only: [:new, :create]

  def new
    @activity = @service_request.activities.new
  end

  def create
    @activity = @service_request.activities.build(activity_params)
    @activity.user_id = current_user.id

    if @activity.save
      redirect_to service_request_path(@service_request), notice: 'Activity has been added'
    else
      render 'new'
    end
  end

  private
    def set_service_request
      @service_request = ServiceRequest.find(params[:service_request_id])
    end

    def activity_params
      params.require(:activity).permit(:body)
    end
end
