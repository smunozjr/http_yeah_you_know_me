require 'socket'
# require 'response'
class Server
  attr_reader :tcp_server

  def initialize
    @tcp_server = TCPServer.new(9292)
    @count = 0
    @request_total_count = 0
  end

  def run
    while true
      @client = @tcp_server.accept
      puts "Ready for a request"

      request_lines = []
      # def request_lines
        while line = @client.gets and !line.chomp.empty?
          request_lines << line.chomp
        end
        puts "Got this request:"
        # puts @request.inspect
        request_lines
      # end





      puts "Sending response."
      def response(request_lines)
        ResponseBuilder.new.parsing_lines(request_lines)
      end
      verb = request_lines[0].split(" ")[0]
      path = request_lines[0].split(" ")[1]
      host = request_lines[1].chars[5..14].join
      port = request_lines[1].chars[16..19].join
      origin = host
      accept = request_lines[6]
      response = ["<pre>", "Verb: #{verb}", "Path: #{path}", "Host: #{host}", "Port: #{port}", "Origin: #{host}", "#{accept}", "</pre>"].join("\n")
        if verb == "POST"
          if path == "/start_game"
          elsif path == "/game"
          end
        elsif verb == "GET"
          if path == "/game"
          elsif path == "/"
            output = "<html><head></head><body>#{response}</body></html>"
          elsif path == "/hello"
            output = "<html><head></head><body>#{response}hello world!#{@count}</body></html>"
          elsif path == "/datetime"
            response = Time.now.strftime('%H:%M%p on %A, %B %d, %Y')
            output = "<html><head></head><body>#{response}</body></html>"
          elsif path == "/shutdown"
            response = "Total Requests: #{@request_total_count}"
            output = "<html><head></head><body>#{response}</body></html>"
          elsif path.include?("/wordsearch")
                dictionary = File.read('/usr/share/dict/words').split("\n")
                word = path.split('?')[1].split('=')[1]
                output = if dictionary.include?(word)
                  "#{word.upcase} is a known word"
                else
                 "#{word.upcase} is not a known word"
               end
             else
            "/"
          end
        end
        @count += 1 if path == "/hello"
        @request_total_count +=1


      puts @count
      #response
      headers = ["http/1.1 200 ok",
                "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                "server: ruby",
                "content-type: text/html; charset=iso-8859-1",
                "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      @client.puts headers
      @client.puts output

      puts ["Wrote this response:", headers, output].join("\n")
      puts "\nResponse complete, exiting."
      break if path == "/shutdown"
    end
    @client.close
    @tcp_server.close
  end
end
