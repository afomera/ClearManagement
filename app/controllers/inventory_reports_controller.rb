class InventoryReportsController < ApplicationController
  before_action :set_inventory_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @inventory_reports = InventoryReport.order("created_at DESC")
    @inventory_total = InventoryReport.select("sum(dish_count) as dish_count, sum(cannister_count) as cannister_count, sum(modem_count) as modem_count, sum(radio_count) as radio_count, sum(raven_upgrade_kit_count) as raven_upgrade_kit_count,
    sum(upgradearm_count) as upgradearm_count, sum(voip_count) as voip_count, sum(trimast_count) as trimast_count")

    authorize @inventory_reports
  end

  def new
    @inventory_report = InventoryReport.new
    authorize @inventory_report
  end

  def create
    @inventory_report = InventoryReport.create(inventory_report_params)

    if @inventory_report.save
      redirect_to inventory_reports_path, notice: "Your Inventory Report has been added"
    else
      render 'new'
    end

    authorize @inventory_report
  end

  def show
    authorize @inventory_report
  end

  def edit
    authorize @inventory_report
  end

  def update
    if @inventory_report.update(inventory_report_params)
      redirect_to @inventory_report, notice: "This report was updated!"
    else
      render 'edit'
    end
    authorize @inventory_report
  end

  def destroy
    @inventory_report.destroy
    redirect_to inventory_reports_path, notice: "That inventory report has been permanently deleted!"
    authorize @inventory_report
  end

  private

    def set_inventory_report
      @inventory_report = InventoryReport.find(params[:id])
    end

    def inventory_report_params
      params.require(:inventory_report).permit(:technician_name, :dish_count, :cannister_count, :modem_count, :radio_count, :voip_count, :trimast_count, :upgradearm_count, :raven_upgrade_kit_count, :notes)
    end
end
