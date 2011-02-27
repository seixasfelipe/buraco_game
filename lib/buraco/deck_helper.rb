module Buraco
  class DeckHelper

    def self.create_cards(options = {})
      suit = options[:of]

      (1..13).inject(Array.new) do |cards, index|
        cards << Card.new(suit, index)
      end
    end

    def self.select(cards, options = {})
      suit = options[:of]

      cards.select {|c| c.suit == suit }      
    end

    def self.sort(cards)
      sorted_cards =      DeckHelper.select(cards, :of => :hearts)
      sorted_cards.concat DeckHelper.select(cards, :of => :clubs)
      sorted_cards.concat DeckHelper.select(cards, :of => :diamonds)
      sorted_cards.concat DeckHelper.select(cards, :of => :spades)
    end

  end
end
