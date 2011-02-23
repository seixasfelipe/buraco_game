module Buraco
  class Player

    attr_accessor :name, :hand_cards

    def initialize(name)
      @name = name
      @hand_cards = Array.new
    end

  end
end
