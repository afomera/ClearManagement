class InventoryReportsController < ApplicationController
  before_action :set_inventory_report, only: [:show, :edit, :update, :destroy]
  def index
    @inventory_reports = InventoryReport.order("created_at DESC")
  end

  def new
    @inventory_report = InventoryReport.new
  end

  def create
    @inventory_report = InventoryReport.create(inventory_report_params)

    if @inventory_report.save
      redirect_to inventory_reports_path, notice: "Your Inventory Report has been added"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @inventory_report.update(inventory_report_params)
      redirect_to @inventory_report, notice: "This report was updated!"
    else
      render 'edit'
    end
  end
  def destroy
    @inventory_report.destroy
    redirect_to inventory_reports_path, notice: "That inventory report has been permanently deleted!"
  end
  private
    def set_inventory_report
      @inventory_report = InventoryReport.find(params[:id])
    end

    def inventory_report_params
      params.require(:inventory_report).permit(:technician_name, :dish_count, :cannister_count, :modem_count, :radio_count, :voip_count, :trimast_count, :upgradearm_count, :raven_upgrade_kit_count, :notes)
    end
end
