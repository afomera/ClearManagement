class Technician < ActiveRecord::Base
  validates_presence_of :name, :phone_number, :email
end
