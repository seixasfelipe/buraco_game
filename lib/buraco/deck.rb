module Buraco
  class Deck
    
    attr_accessor :cards, :is_shuffled

    def initialize
      @cards = get_new_deck_cards
    end

    def get_new_deck_cards
      suits = [:hearts, :clubs, :diamonds, :spades]

      cards = Array.new
      suits.map do |s|
        2.times { cards.concat DeckHelper.create_cards :of => s }
      end
      
      cards
    end

    def shuffled?
      @is_shuffled = false if @is_shuffled.nil?

      @is_shuffled      
    end

    def shuffle
      @cards.shuffle!
      @is_shuffled = true
    end

  end
end
