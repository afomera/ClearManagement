class ServiceRequest < ActiveRecord::Base
  validates_presence_of :customer_name, :address, :description

  scope :status, -> (status) { where(status: status) }
end
