class AddFieldsToTechnicians < ActiveRecord::Migration
  def change
    add_column :technicians, :street, :string
    add_column :technicians, :city, :string
    add_column :technicians, :state, :string
    add_column :technicians, :zipcode, :string
  end
end
