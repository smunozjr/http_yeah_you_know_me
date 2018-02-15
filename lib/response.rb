require './lib/serv_1'

class ResponseBuilder
  attr_reader :response

  def initialize(request_lines)
    @request_total_count = 0
    @count = 0
    @verb = request_lines[0].split(" ")[0]
    @path = request_lines[0].split(" ")[1]
    @host = request_lines[1].chars[5..14].join
    @port = request_lines[1].chars[16..19].join
    @origin = @host
    @accept = request_lines[6]
    @response = ["<pre>", "Verb: #{@verb}", "Path: #{@path}", "Host: #{@host}", "Port: #{@port}", "Origin: #{@host}", "#{@accept}", "</pre>"].join("\n")
    parsing_path
  end
    # if @verb == "POST"
    # # content_length = request_lines[3].split[1]
    # # post_request_body = @client.read(content_length.to_i)
    # end
    # if @path == "/start_game"
    #   output = "<html><head></head><body>Good luck!#{response}</body></html>"
    #   game = Game.new
    # elsif @path == "/game"
    # elsif @verb == "GET"
    # end
  def parsing_path
    @request_total_count += 1
    if @path == "/game"
    elsif @path == "/"
      output = "<html><head></head><body>#{@response}</body></html>"
    elsif @path == "/hello"
      hello_world
    elsif @path == "/datetime"
      response = Time.now.strftime('%H:%M%p on %A, %B %d, %Y')
      output = "<html><head></head><body>#{@response}</body></html>"
    elsif @path == "/shutdown"
      response = "Total Requests: #{@request_total_count}"
      output = "<html><head></head><body>#{response}</body></html>"
    elsif @path.include?("/wordsearch")
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

  def hello_world
    @count += 1
   "<html><head></head><body>#{@response}hello world!#{@count}</body></html>"
  end
end
