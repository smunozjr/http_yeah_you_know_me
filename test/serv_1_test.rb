require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/serv_1'

class ServerTest < Minitest::Test
  def test_it_exist
    server = Server.new

    assert_instance_of Server, server
  end

end
