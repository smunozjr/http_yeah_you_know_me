require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'

class ResponseBuilderTest < Minitest::Test

  def test_it_exist
    response = ResponseBuilder.new(request)
    request = ["GET / HTTP/1.1",
 "Host: 127.0.0.1:9292",
 "Connection: keep-alive",
 "Cache-Control: no-cache",
 "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36",
 "Postman-Token: 3e317b34-c85a-d1ba-277a-c6ca21113738",
 "Accept: */*",
 "Accept-Encoding: gzip, deflate, br",
 "Accept-Language: en-US,en;q=0.9,la;q=0.8"]

    assert_instance_of ResponseBuilder, response
  end

  def test_it_has_a_response
    response = ResponseBuilder.new(request)
    request = ["GET / HTTP/1.1",
 "Host: 127.0.0.1:9292",
 "Connection: keep-alive",
 "Cache-Control: no-cache",
 "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36",
 "Postman-Token: 3e317b34-c85a-d1ba-277a-c6ca21113738",
 "Accept: */*",
 "Accept-Encoding: gzip, deflate, br",
 "Accept-Language: en-US,en;q=0.9,la;q=0.8"]
    assert_equal "verb", response
  end

end
