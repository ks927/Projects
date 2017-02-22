require 'socket'

host = 'localhost' # The web server
port = 8000 # Default HTTP port
path = '/index.html' # The file we want

puts "Choose GET or POST"
choice = gets.chomp

# This is the HTTP request we send to fetch a file
if choice == "GET"
    request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port) # Connect to server
socket.print(request) # Send request
response = socket.read # Read complete response

# Split response at first blank line into headers and body
headers,body = response.split('\r\n\r\n', 2)
puts body # Display it
end