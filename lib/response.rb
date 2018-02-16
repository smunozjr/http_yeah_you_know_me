require './lib/serv_1'

class Response
  attr_reader :response,
              :verb

  @@count = 0
  def initialize(request_lines)
    @verb = request_lines[0].split(" ")[0]
    @path = request_lines[0].split(" ")[1]
    @host = request_lines[1].chars[5..14].join
    @port = request_lines[1].chars[16..19].join
    @origin = @host
    @accept = request_lines[6]
    @request_lines = request_lines
    @response = ["<pre>", "Verb: #{@verb}", "Path: #{@path}", "Host: #{@host}", "Port: #{@port}", "Origin: #{@host}", "#{@accept}", "</pre>"].join("\n")
  end


  def get_response(request_total_count = 0)
    if @verb == "POST"
    content_length = @request_lines[3].split[1]
    end
    if @path == "/start_game"
      output = "<html><head></head><body>Good luck!#{response}</body></html>"
      game = Game.new
    elsif @path == "/game"
    elsif @verb == "GET"
    end
    if @path == "/game"
      output = "<html><head></head><body>Good luck!#{response}</body></html>"
    elsif @path == "/"
      output = "<html><head></head><body>#{response}</body></html>"
    elsif @path == "/hello"
      output = hello_world
    elsif @path == "/datetime"
      response = Time.now.strftime('%H:%M%p on %A, %B %d, %Y')
      output = "<html><head></head><body>#{response}</body></html>"
    elsif @path == "/shutdown"
      response = "Total Requests: #{request_total_count}"
      output = "<html><head></head><body>#{response}</body></html>"
    elsif @path.include?("/wordsearch")
      dictionary = File.read('/usr/share/dict/words').split("\n")
      word = @path.split('?')[1].split('=')[1]
      output = if dictionary.include?(word)
      "#{word.upcase} is a known word"
      else
        "#{word.upcase} is a unknown word"
      end
    else
      "/"
    end
    output
  end

  def hello_world
    @@count += 1
  "<html><head></head><body>#{response}hello world!#{@@count}</body></html>"
  end
end
