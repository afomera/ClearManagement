class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request
end
