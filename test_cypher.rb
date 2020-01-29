require "minitest/autorun"

require_relative "cypher"

class TestCypher < Minitest::Test
  def setup
    @cypher = Cypher.new
  end

  def test_initial_card_order
    initial_order_manual = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "a", "b"]
    assert_equal initial_order_manual, Cypher.initial_card_order
    assert_equal initial_order_manual, @cypher.deck
  end

  def test_joker_a
    first_move_result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "b", "a"]
    @cypher.joker_a
    assert_equal first_move_result, @cypher.deck
    second_move_result = [1, "a", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "b"]
    @cypher.joker_a
    assert_equal second_move_result, @cypher.deck
    # p @cypher.deck
  end

  def test_joker_b_basic
    first_move_result = [1, 2, "b", 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "a"]
    @cypher.joker_b
    assert_equal first_move_result, @cypher.deck
    second_move_result = [1, 2, 3, 4, "b", 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "a"]
    @cypher.joker_b
    assert_equal second_move_result, @cypher.deck
    # p @cypher.deck
  end

  def test_joker_b_extra
    @cypher.joker_a
    @cypher.joker_b
    move_result = [1, "b", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "a"]
    assert_equal move_result, @cypher.deck
    # p @cypher.deck
  end

  def test_triple_cut
    @cypher.joker_a
    @cypher.joker_b
    @cypher.triple_cut
    move_result = ["b", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, "a", 1]
    assert_equal move_result, @cypher.deck
    # p @cypher.deck
  end
end