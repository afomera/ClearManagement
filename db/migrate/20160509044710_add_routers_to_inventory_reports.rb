class AddRoutersToInventoryReports < ActiveRecord::Migration
  def change
    add_column :inventory_reports, :routers, :integer, default: 0
  end
end
