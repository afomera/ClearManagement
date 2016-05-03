class TechniciansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_technician, only: [:show, :update, :edit, :destroy]

  def index
    @technician = current_user.technicians.all
  end

  def create
    @technician = current_user.technicians.build(technician_params)

    if @technician.save
      redirect_to technicians_path, notice: 'Technician has been added'
    else
      render 'new'
    end
  end

  def new
    @technician = current_user.technicians.new
  end

  def show
  end

  def edit
  end

  def update
    if @technician.update(technician_params)
      redirect_to technicians_path, notice: 'Technician has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    @technician.destroy
    redirect_to technicians_path, notice: 'Technician has been deleted'
  end

  private
    def technician_params
      params.require(:technician).permit(:name, :phone_number, :email, :street, :city, :state, :zipcode)
    end

    def set_technician
      @technician = Technician.find(params[:id])
    end
end
