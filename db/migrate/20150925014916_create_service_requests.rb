class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_email
      t.string :address
      t.string :city
      t.string :zipcode
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end
