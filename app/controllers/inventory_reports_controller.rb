class InventoryReportsController < ApplicationController
  def index
    @inventory_reports = InventoryReport.all
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

  private
    def inventory_report_params
      params.require(:inventory_report).permit(:technician_name, :dish_count, :cannister_count, :modem_count, :radio_count, :voip_count, :trimast_count, :upgradearm_count, :raven_upgrade_kit_count, :notes)
    end
end
