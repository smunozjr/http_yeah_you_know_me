require 'socket'

tcp_server = TCPServer.new(9292)
count = 0
request_total_count = 0
while true
client = tcp_server.accept

puts "Ready for a request"
request_lines = []
while line = client.gets and !line.chomp.empty?
  request_lines << line.chomp
end



puts "Got this request:"
puts request_lines.inspect



puts "Sending response."

class Response
  attr_reader :response

  def initialize(request_lines)
    @verb = request_lines[0].split(" ")[0]
    @path = request_lines[0].split(" ")[1]
    @host = request_lines[1].chars[5..14].join
    @port = request_lines[1].chars[16..19].join
    @origin = host
    @accept = request_lines[6]
    @count = 0
    @response = ["<pre>", "Verb: #{verb}", "Path: #{path}", "Host: #{host}", "Port: #{port}", "Origin: #{host}", "#{accept}", "</pre>"].join("\n")
  end

  def read_path
    if path == "/"
      output = "<html><head></head><body>#{response.response}</body></html>"
    elsif path == "/hello"
      output = "<html><head></head><body>#{response.response}hello world!#{@count}</body></html>"
    elsif path == "/datetime"
      response = Time.now.strftime('%H:%M%p on %A, %B %d, %Y')
      output = "<html><head></head><body>#{response.response}</body></html>"
    elsif path == "/shutdown"
      response = "Total Requests: #{request_total_count}"
      output = "<html><head></head><body>#{response.response}</body></html>"
    elsif path == "/wordsearch"
      response = File.read('/usr/share/dict/words')
      require "pry"; binding.pry
        output = if response.includes(word)
        "#{word.upcase} is a known word"
      else
        "#{word.upcase} is not a known word"
      end
    else
      "/"
  end
    @count += 1 if path == "/hello"
    output


    request_total_count +=1
  # end


end

headers = ["http/1.1 200 ok",
  "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
  "server: ruby",
  "content-type: text/html; charset=iso-8859-1",
  "content-length: #{output.length}\r\n\r\n"].join("\r\n")
client.puts headers
client.puts output

puts ["Wrote this response:", headers, output].join("\n")
puts "\nResponse complete, exiting."

response = Response.new(request_lines)
# output = "<html><head></head><body>#{response.response}</body></html>"


puts count

end


# require 'socket'
# require_relative 'response'
#
# class Server
#   attr_reader :client,
#               :request_lines
#
#   def initialize
#     @tcp_server = TCPServer.new(9292)
#     @request_lines = []
#     @count = 0
#     @request_total_count = 0
#   end
#
#   def start_server
#     while @tcp_server
#       @request_lines = []
#       client = tcp_server.accept
#
#       while line = client.gets and !line.chomp.empty?
#         @request_lines << line.chomp
#       end
#     end
#       client.close
#   end
#
# puts "Got this request:"
# puts @request_lines.inspect
#
#
#
# puts "Sending response."
#
# end





#request_lines.join("\n")
# puts "verb:".capitalize + " #{verb}"
# puts "path:".capitalize + " #{path}"
# puts "host:".capitalize + " #{host}"
# puts "port:".capitalize + " #{port}"
# puts "origin:".capitalize + " #{origin}"
# puts "#{accept}"
# puts count
