require 'ipaddr'

class IpAddrValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    IPAddr.new value
  rescue IPAddr::InvalidAddressError
    record.errors[attribute] << (options[:message] || 'is not a valid IP (v4/v6) addresss or range')
  end
end
