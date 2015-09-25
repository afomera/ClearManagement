class AddApartmentToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :apartment, :string
  end
end
