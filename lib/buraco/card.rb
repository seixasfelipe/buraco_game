module Buraco
  class Card
  
    attr_accessor :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

#    def ==(other)
#      self.suit == other.suit && self.value == other.value
#    end
    
    def eql?(other)
      self.suit == other.suit && self.value == other.value
    end

  end
end
