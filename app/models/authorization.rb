class Authorization < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true

  belongs_to :user
end
