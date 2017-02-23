require 'socket'
require 'json'

server = TCPServer.open(8000) # Socket to listen on port 2000
loop { #Servers run forever
  client = server.accept  # Wait for a client to connect
  method = client.gets.split # Split the request line
    
    if method[0] == "POST"
        hash = method
        params = JSON.parse(hash)
    end
        
        
    if method[0] == "GET" # 1st element = GET
        path = method[1].to_s 
        if File.file?(path) # if 2nd elem = our file
            f = File.open(path) # open that file
            response = f.read # read it
            f.close # close it
            client.puts "HTTP/1.0 200 OK\r\n" +
                    "content-type: text/html\r\n" +
                    "content-length: #{response.bytesize}\r\n\r\n"
            client.print response
            client.close
            else
            client.puts "HTTP/1.1 404 Not Found\r\n"
        end
    end
    client.close
}
