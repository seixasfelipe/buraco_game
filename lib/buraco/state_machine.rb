require 'observer'

module Buraco
  class StateMachine
    include Observable

    def initialize
      @states = create_states
      @current_state = :new_deck
    end

    def current
      @current_state
    end

    def next(state = nil)
      state ||= @current_state

      @current_state = @states[state] unless @states[state] == nil

      changed
      notify_observers(:state_changed, @current_state)

      @current_state
    end

    def skip_to(state)
      @current_state = state unless @states[state] == nil
    end

    private

    def create_states
      { 
        new_deck:           :shuffle_deck,
        shuffle_deck:       :give_dead_cards,
        give_dead_cards:    :give_players_cards,
        give_players_cards: :start_game,
        start_game:         :change_player,
        change_player:      :draw_card,
        draw_card:          [:play_cards, :discard_card],
        discard_card:       [:change_player, :end_game, :draw_dead_cards],
        play_cards:         [:play_cards, :discard_card, :draw_dead_cards, :end_game],
        draw_dead_cards:    [:play_cards, :discard_card],
        end_game:           :calculate_points
      }
    end
  end
end