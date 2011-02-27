module Buraco
  class DeckHelper

    def self.create_cards(options = {})
      suit = options[:of]

      (1..13).inject(Array.new) do |cards, index|
        cards << Card.new(suit, index)
      end
    end

  end
end
