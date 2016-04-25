class AddLatitudeAndLongitudeToTechnicians < ActiveRecord::Migration
  def change
    add_column :technicians, :latitude, :float
    add_column :technicians, :longitude, :float
  end
end
