class EmailBlacklistDomain < ActiveRecord::Base
  validates :value, presence: true, uniqueness: { case_sensitive: false }
end
