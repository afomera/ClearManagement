class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :technician

  has_many :messages
end
