require_relative 'serv_1'

class ResponseBuilder
  attr_reader :verb,
              :path,
              :host,
              :port,
              :origin,
              :accept,
              :response

  def initialize(request_lines)
    @verb = request_lines[0].split(" ")[0]
    @path = request_lines[0].split(" ")[1]
    @host = request_lines[1].chars[5..14].join
    @port = request_lines[1].chars[16..19].join
    @origin = host
    @accept = request_lines[6]
    @response = ["<pre>", "Verb: #{verb}", "Path: #{path}", "Host: #{host}", "Port: #{port}", "Origin: #{host}", "#{accept}", "</pre>"].join("\n")
  end
end
