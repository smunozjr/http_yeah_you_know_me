














# class Request
#   def initialize(client)
#     @request_lines = []
#     receives_request(client)
#   end
#
#   def receives_request(client)
#     while line = client.gets and !line.chomp.empty?
#       @request_lines << line.chomp
#     end
#   end
#
#   def request_lines
#     request_lines.inspect
#   end
# end
