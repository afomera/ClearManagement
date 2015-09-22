class CreateInventoryReports < ActiveRecord::Migration
  def change
    create_table :inventory_reports do |t|
      t.string :technician_name
      t.integer :dish_count
      t.integer :cannister_count
      t.integer :modem_count
      t.integer :radio_count
      t.integer :voip_count
      t.integer :trimast_count
      t.integer :upgradearm_count
      t.integer :raven_upgrade_kit_count
      t.text :notes

      t.timestamps null: false
    end
  end
end
