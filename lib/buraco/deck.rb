module Buraco
  class Deck
    
    attr_accessor :cards
  
    def initialize
      @cards = DeckHelper.create_cards :of => :hearts
      @cards.concat DeckHelper.create_cards :of => :hearts
      @cards.concat DeckHelper.create_cards :of => :clubs
      @cards.concat DeckHelper.create_cards :of => :clubs
      @cards.concat DeckHelper.create_cards :of => :diamonds
      @cards.concat DeckHelper.create_cards :of => :diamonds
      @cards.concat DeckHelper.create_cards :of => :spades
      @cards.concat DeckHelper.create_cards :of => :spades
    end

    def shuffled?
    end
  
  end
end
