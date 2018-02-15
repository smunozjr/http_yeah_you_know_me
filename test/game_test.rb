require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exist
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_has_random_numbers
    game = Game.new

    assert_includes (0..100).to_a, game.random_number
  end

  def test_it_returns_correct_feedback
    game = Game.new
    game.random_number = 50
    game.guess = 50

    assert_equal "Correct", game.feedback
  end

  def test_it_returns_too_low_feedback
    game = Game.new
    game.random_number = 50
    game.guess = 49

    assert_equal "too low", game.feedback
  end

  def test_it_returns_too_high_feedback
    game = Game.new
    game.random_number = 50
    game.guess = 60

    assert_equal "too high", game.feedback
  end
end
