require 'socket'
require 'json'
 
host = 'localhost'     # The web server
port = 8000            # Default HTTP port
path = "index.html"   # The file we want 
post_path = "thanks.html"

puts "Would you like to GET or POST ?"
choice = gets.chomp

# This is the HTTP request we send to fetch a file
if choice == "GET"
    request = "GET #{path} HTTP/1.0\r\n\r\n"
    socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print body                          # And display it

elsif choice == "POST"
    puts "What would you like your Viking name to be?"
    name = gets.chomp
    puts "What would you like your Viking email to be?"
    email = gets.chomp
    hash = {:viking=> {:name=>name, :email=>email} }
    info = hash.to_json
    message = "POST #{post_path} HTTP/1.0\r\n" +
             "From: blah@yahoo.com\r\n" +
             "User-Agent: HTTPTool/1.0\r\n" +
             "Content-Type: application/x-www-form-urlencoded\r\n" +
             "Content-Length: #{info.size}\r\n\r\n" +
             "#{hash}\r\n"
    socket = TCPSocket.open(host,port)
    socket.print(message)
    response = socket.read
    puts "#{message}"
end

### THIS IS WHAT THE SOCKET SENDS TO THE SERVER ###
### AND GETS OUTPUT TO THE TERMINAL ###


