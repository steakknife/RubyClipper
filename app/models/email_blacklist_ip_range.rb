class EmailBlacklistIpRange < ActiveRecord::Base
  validates :value, presence: true, uniqueness: true, ip_addr: true
end
