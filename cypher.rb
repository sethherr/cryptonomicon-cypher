# initial: 1 card at top, 52, a joker, b joker

# 1 move a joker down 1 card
#   - if a joker starts at bottom, in between first two cards
# 2 move b joker down 2 cards 
#   - if b joker starts at bottom, in between first two cards
#   - two discreet position moves. If it ends up last card in either place, it does the in between two
# 3 swap the first chunk (before first joker), with all the cards after the second joker
# 4 bottom id: remove that number of cards from top, insert behind bottom card
#   - if bottom card is either joker, has value of 53

class Cypher
  def self.initial_card_order
    Array(1..52) + %w[a b]
  end
  
  attr_accessor :deck

  def initialize
    @deck = self.class.initial_card_order
  end

  def joker_a
    if @deck.last == "a"
      @deck.pop
      first = @deck.shift
      @deck = [first, "a", *@deck]
    else
      a_position = @deck.index("a")
      pre_a = @deck.slice(0, a_position)
      one_after_a = @deck[a_position + 1]
      after_one_after = @deck.slice(a_position + 2, 54 - a_position + 1)
      @deck = pre_a + [one_after_a] + ["a"] + after_one_after
    end
  end

  def joker_b_one_move
    if @deck.last == "b"
      @deck.pop
      first = @deck.shift
      @deck = [first, "b", *@deck]
    else
      b_position = @deck.index("b")
      pre_b = @deck.slice(0, b_position)
      one_after_b = @deck[b_position + 1]
      after_one_after = @deck.slice(b_position + 2, 54 - b_position + 1)
      @deck = pre_b + [one_after_b] + ["b"] + after_one_after
    end
  end

  def joker_b
    joker_b_one_move
    joker_b_one_move
  end

  def triple_cut
    b_position = @deck.index("b")
    a_position = @deck.index("a")
    first_joker = b_position > a_position ? a_position : b_position
    second_joker = b_position > a_position ? b_position : a_position
  end
end
