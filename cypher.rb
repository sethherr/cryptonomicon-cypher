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
  def do_code
    "code"
  end
end
