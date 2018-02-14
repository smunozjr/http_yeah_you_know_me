require 'socket'
require_relative 'response'

class Server
  def initialize
    @tcp_server = TCPServer.new(9292)
    @request_lines = []
    @count = 0
    @request_total_count = 0
  end

  def start_server
    while @tcp_server
      @request_lines = []
      client = tcp_server.accept

      while line = client.gets and !line.chomp.empty?
        @request_lines << line.chomp
      end
    end
      client.close
  end

puts "Got this request:"
puts request_lines.inspect



puts "Sending response."

end





#request_lines.join("\n")
# puts "verb:".capitalize + " #{verb}"
# puts "path:".capitalize + " #{path}"
# puts "host:".capitalize + " #{host}"
# puts "port:".capitalize + " #{port}"
# puts "origin:".capitalize + " #{origin}"
# puts "#{accept}"
# puts count
