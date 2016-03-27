class TechniciansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_technican, only: [:show, :update, :edit, :destroy]

  def index
    @technician = Technician.all
  end

  def create
    @technician = Technician.new(technician_params)

    if @technician.save
      redirect_to root_path, notice: 'Technician has been added'
    else
      render 'new'
    end
  end

  def new
    @technician = Technician.new
  end

  def show
  end

  def edit
  end

  def update
    if @technician.update(technician_params)
      redirect_to root_path, notice: 'Technician has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    @technician.destroy
    redirect_to root_path, notice: 'Technician has been deleted'
  end

  private
    def technician_params
      params.require(:technician).permit(:name, :phone_number, :email)
    end

    def set_technican
      @technician = Technician.find(params[:id])
    end
end
