require 'socket'

server = TCPServer.open(8000) # Socket to listen on port 2000
loop { #Servers run forever
    client = server.accept # Wait for a client to connect
    request = client.gets
    trimmed_request = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')
    filename = trimmed_request.chomp
    if filename == ""
        filename = "index.html"
        client.puts "HTTP/1.1 200 OK\r\n" +
                     "Content-Type: text/plain\r\n" +
                     "Content-Length: #{File.size(filename)}\r\n" +
                     "Connection: close\r\n\r\n"
    end
    begin
        display_file = File.open(filename, 'r')
        content = display_file.read()
        client.print content
    rescue Errno::ENOENT
        client.print "File not found"
    end
    client.close
    }
