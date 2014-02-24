class Authorization < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :provider
  validates_presence_of :uid
end
