class Technician < ActiveRecord::Base
  validates_presence_of :name, :phone_number, :email, :street, :city, :state, :zipcode

  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, state, zipcode].compact.join(', ')
  end
end
