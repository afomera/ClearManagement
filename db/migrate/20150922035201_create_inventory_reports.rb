class CreateInventoryReports < ActiveRecord::Migration
  def change
    create_table :inventory_reports do |t|
      t.string :technician_name
      t.integer :dish_count, default: 0
      t.integer :cannister_count, default: 0
      t.integer :modem_count, default: 0
      t.integer :radio_count, default: 0
      t.integer :voip_count, default: 0
      t.integer :trimast_count, default: 0
      t.integer :upgradearm_count, default: 0
      t.integer :raven_upgrade_kit_count, default: 0
      t.text :notes

      t.timestamps null: false
    end
  end
end
