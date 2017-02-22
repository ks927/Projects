require 'socket'

hostname = 'localhost'
port = 8000

s = TCPSocket.open(hostname, port)

while line = s.gets # Read lines from the socket
   puts line.chop # Print with platform line terminator
    
end
s.close # Close socket when done