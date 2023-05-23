require 'net/http'

url = URI.parse('http://www.example.com')
http = Net::HTTP.new(url.host, url.port)

# Optional: Set any additional headers if needed
http.headers['User-Agent'] = 'My User Agent'

# Optional: Set up SSL/TLS if accessing an HTTPS URL
http.use_ssl = (url.scheme == 'https')

response = http.get(url.path)

puts "Response code: #{response.code}"
puts "Response body:"
puts response.body
