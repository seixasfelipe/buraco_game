module Buraco
  class StateMachine

    def initialize
      @states = { new_deck: :shuffle_deck }
      @current_state = :new_deck
    end

    def current
      @current_state
    end

    def next
      @current_state = @states[@current_state]
      @current_state
    end
  end
end