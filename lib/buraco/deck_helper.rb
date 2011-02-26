module Buraco
  class DeckHelper

    def self.create_cards(options = {})
      suit = options[:of]

      [
        Card.new(suit, 1),
        Card.new(suit, 2),
        Card.new(suit, 3),
        Card.new(suit, 4),
        Card.new(suit, 5),
        Card.new(suit, 6),
        Card.new(suit, 7),
        Card.new(suit, 8),
        Card.new(suit, 9),
        Card.new(suit, 10),
        Card.new(suit, 11),
        Card.new(suit, 12),
        Card.new(suit, 13)
      ]    
    end

  end
end
