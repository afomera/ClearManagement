class ServiceRequest < ActiveRecord::Base
  validates_presence_of :customer_name, :address, :description

  scope :status, -> (status) { where(status: status) }

  def customer_phone_number
    if self.customer_phone.empty?
      "No phone number on file"
    else
      self.customer_phone
    end
  end

  def customer_email_address
    if self.customer_email.empty?
      "No email on file"
    else
      self.customer_email
    end
  end
end
