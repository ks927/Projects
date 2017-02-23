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
    method = header.split # split headers
    content_length = header.split.last.to_i # split headers and retrieve last one
    viking_hash = client.read(content_length) # store hash in variable
    if method[0] == "POST" # if first elem is POST
        path = method[1].to_s # second elem is path
        if File.exist?(path)
            params = JSON.parse(viking_hash) # parse the hash
            new_yield = "<li>Name: #{params['viking']['name']}</li><li>Email: #{params['viking']['email']}</li>"
            file = File.read(path) # open that file
            body = file.gsub('<%= yield %>', new_yield) # sub parsed hash in body
            client.print "HTTP/1.0 200 OK\r\n" +
                         "Content-Type: text/html\r\n" +
                         "Content-Length: #{body.bytesize}" +
                         "Connection: close\r\n"
            client.print body # print the body
        end
            
    elsif method[0] == "GET" # 1st element = GET
        path = method[1].to_s 
        if File.exist?(path) # if 2nd elem = our file
            file = File.read(path) # open that file
            client.print "HTTP/1.0 200 OK\r\n" +
                    "Content-Type: text/html\r\n" +
                    "Content-Length: #{file.size}\r\n" +
                    "Connection: close\r\n\r\n"
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
