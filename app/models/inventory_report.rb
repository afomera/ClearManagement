class InventoryReport < ActiveRecord::Base
  validates_presence_of :technician_name, :dish_count, :cannister_count, :modem_count,
                        :radio_count, :voip_count, :trimast_count, :upgradearm_count,
                        :raven_upgrade_kit_count

end
