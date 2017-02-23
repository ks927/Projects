require 'socket'
require 'json'

server = TCPServer.open(8000) # Socket to listen on port 2000
loop { #Servers run forever
  client = server.accept  # Wait for a client to connect
  header = ""
  while line = client.gets # read lines from client
    header += line 
    break if header =~ /\r\n\r\n$/ # breaks at end of initial request line
  end
    puts "Request: #{header}"
    method = header.split # split header
    if method[0] == "GET" # 1st element = GET
        path = method[1].to_s 
        if File.exist?(path) # if 2nd elem = our file
            file = File.read(path) # open that file
            client.print "HTTP/1.0 200 OK\r\n" +
                    "Content-Type: text/html\r\n" +
                    "Content-Length: #{file.size}\r\n\r\n"
            client.print file
        else
            message = "File not found"
            client.print "HTTP/1.1 404 Not Found\r\n" +
                         "Content-Length: #{message.size}\r\n" +
                         "Connection: close\r\n\r\n"
            client.print message
        end
    end
    client.close
}
