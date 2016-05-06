class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

  has_many :conversations
  has_many :messages, through: :conversations
  has_many :technicians

  def full_name
    self.first_name + " " + self.last_name
  end
end
