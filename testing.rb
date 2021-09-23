require_relative 'require'

p p1 = Player.new('Mike')
p p1.hand
c1 = Card.new('1', '2', '3')
c2 = Card.new('1','2','3')
c1.random_card
c2.random_card
p p1.hand.get_card(c1)
p p1.hand.clear_hand
p p1
p p1.hand.get_card(c2)
p p1
