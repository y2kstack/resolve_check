require 'resolv'

def watch_resolv_conf
  previous_dns_servers = nil

  loop do
    current_dns_servers = Resolv::DNS.new.getresources("localhost", Resolv::DNS::Resource::IN::NS).map(&:name).map(&:to_s)

    if previous_dns_servers.nil?
      puts "Initial DNS configuration:"
      puts current_dns_servers
    elsif current_dns_servers != previous_dns_servers
      puts "Changes detected in DNS configuration:"
      puts current_dns_servers
    end

    previous_dns_servers = current_dns_servers

    sleep 1  # Wait for 1 second before checking again
  end
end

watch_resolv_conf
