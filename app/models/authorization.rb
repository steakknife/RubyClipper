class Authorization < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :provider
  validates_presence_of :uid
end
