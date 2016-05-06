class Technician < ActiveRecord::Base
  validates_presence_of :name, :phone_number, :email, :street, :city, :state, :zipcode

  belongs_to :user
  has_one :conversation, :dependent => :destroy

  geocoded_by :address
  after_validation :geocode

  # After creation create the conversation record so it exists
  # It's used to tie in messages sent to the Tech
  after_create :create_conversation!

  def address
    [street, city, state, zipcode].compact.join(', ')
  end

  def create_conversation!
    # Would have normally used just Conversation.create here, but choose to
    # use find_or_create_by to ensure that it would not somehow create orphan records
    Conversation.find_or_create_by(technician: self, user: self.user)
  end
end
