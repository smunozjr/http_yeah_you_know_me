require 'socket'
require './lib/response'
require './lib/game'

class Server
  attr_reader :tcp_server

  def initialize
    @tcp_server = TCPServer.new(9292)
    @count = 0
    @request_total_count = 0
    @output = ""
    @server_loop = true
  end

  def run
    while @server_loop
      @client = tcp_server.accept

      request_lines = []
        while line = @client.gets and !line.chomp.empty?
          request_lines << line.chomp
        end

        response(request_lines)
        printing_headers
        @server_loop = false if @output.include? 'Total'
    end
    @client.close
    tcp_server.close
  end

    def response(request_lines)
      @output = ResponseBuilder.new(request_lines)
      @output = @output.response
    end

    def printing_headers 
      headers = ["http/1.1 200 ok",
                "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                "server: ruby",
                "content-type: text/html; charset=iso-8859-1",
                "content-length: #{@output.length}\r\n\r\n"].join("\r\n")
      @client.puts headers
      @client.puts @output

      puts ["Wrote this response:", headers, @output].join("\n")
      puts "\nResponse complete, exiting."
    end
end
