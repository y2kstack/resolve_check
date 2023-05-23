def watch_resolv_conf
  resolv_conf_path = '/etc/resolv.conf'
  previous_contents = nil

  loop do
    if File.exist?(resolv_conf_path)
      current_contents = File.read(resolv_conf_path)

      if previous_contents.nil?
        puts "Initial /etc/resolv.conf contents:"
        puts current_contents
      elsif current_contents != previous_contents
        puts "Changes detected in /etc/resolv.conf:"
        puts current_contents
      end

      previous_contents = current_contents
    else
      puts "Cannot find #{resolv_conf_path}. DNS configuration not available."
    end

    sleep 1  # Wait for 1 second before checking again
  end
end

watch_resolv_conf
