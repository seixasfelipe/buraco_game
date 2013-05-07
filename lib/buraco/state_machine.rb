module Buraco
  class StateMachine

    def initialize
      @states = 
      { 
        new_deck:           :shuffle_deck,
        shuffle_deck:       :give_dead_cards,
        give_dead_cards:    :give_players_cards,
        give_players_cards: :start_game,
        start_game:         :draw_card,
        draw_card:          [:discard_card, :play_cards],
        discard_card:       [:change_player, :end_game, :draw_dead_cards]
      }
      @current_state = :new_deck
    end

    def current
      @current_state
    end

    def next(state = nil)
      state ||= @current_state

      @current_state = @states[state] unless @states[state] == nil
      @current_state
    end

    def skip_to(state)
      @current_state = state unless @states[state] == nil
    end
  end
end