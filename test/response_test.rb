require './test/test_helper'
require './lib/response'

class ResponseTest < Minitest::Test
  def setup
    @request = ["GET / HTTP/1.1",
    "Host: 127.0.0.1:9292",
    "Connection: keep-alive",
    "Cache-Control: no-cache",
    "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X10_13_3) AppleWebKit/537.36 (KHTML, like Gecko)Chrome/64.0.3282.140 Safari/537.36",
    "Postman-Token: 3e317b34-c85a-d1ba-277a-c6ca21113738",
    "Accept: */*",
    "Accept-Encoding: gzip, deflate, br",
    "Accept-Language: en-US,en;q=0.9,la;q=0.8"]
  end

  def test_it_has_verb
    assert_equal 'GET', Response.new(@request).verb
  end

  def test_for_datetime
    request = ['GET /datetime HTTP/1.1',
               'Host: 127.0.0.1:9292']
    expected = Time.now.strftime('%H:%M%p on %A, %B %d, %Y')
    html = "<html><head></head><body>#{expected}</body></html>"
    result = Response.new(request).get_response

    assert_equal html, result
  end

  def test_dictionary_known_word
     request = ['GET /wordsearch?word=jump HTTP/1.1',
                'Host: 127.0.0.1:9292']
     result = Response.new(request).get_response

     assert_equal 'JUMP is a known word', result
  end

  def test_dictionary_unknown_word
    request = ['GET /wordsearch?word=ghvhgjnj HTTP/1.1',
               'Host: 127.0.0.1:9292']
    result = Response.new(request).get_response

     assert_equal 'GHVHGJNJ is a unknown word', result
  end
end
