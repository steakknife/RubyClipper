class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    $stderr.puts "email validation #{attribute} = #{value}"
    result = false
    if value =~ /\A([^@]+)@([^@]+)\z/
      domain = $2
      result = dns_domain_exists?(domain) && ! forbidden?(domain)
    end
    record.errors[attribute] << (options[:message] || 'is not a valid email address') unless result
  end

protected

  def forbidden?(domain)
    forbidden_dns_domain?(domain) || forbidden_any_ip?(domain)
  end

  def dns_domain_records(domain)
    Resolv::DNS.open do |dns|
      dns_records = dns.getresources(domain, Resolv::DNS::Resource::IN::ANY)
      yield(dns_records)
    end
  end

  def dns_domain_exists?(domain)
    dns_domain_records(domain) do |dns_records|
      return true
    end
    return false
  end

  def forbidden_dns_domain?(domain)
    domain = domain.to_s
    EmailBlacklistDomain.all.each { |email_blacklist_domain|
      if domain =~ /\A.*#{email_blacklist_domain.value}.*\z/i
        return true
      end
    } 
    return false
  end

  def forbidden_any_ip?(domain)
    dns_domain_records(domain) do |dns_records|
      dns_records.map { |dns_record|
        next unless dns_record.respond_to? :address
        return true if forbidden_ip?(dns_record.address)
      }
    end
    return false
  end

  def forbidden_ip?(ip)
    EmailBlacklistIpRange.all.each { |email_blacklist_ip_record|
      begin
        value = email_blacklist_ip_record.value
        return true if IPAddr.new(value).include? ip.to_s
      rescue IPAddr::InvalidAddressError
        logger.warn "invalid ip addr or ip range in email_blacklist_ip table: #{email_blacklist_ip_record}"
      end
    }
    return false
  end
end
