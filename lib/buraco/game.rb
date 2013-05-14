module Buraco
  class Game

    attr_accessor :player, :deck, :dead_cards

    def initialize(output, input, state_machine=StateMachine.new)
      @output = output
      @input = input
      @teams = []
      @dead_cards = Array.new
      @state_machine = state_machine

      @state_machine.add_observer self
    end

    def start
      @output.puts 'Bem vindo ao jogo de Buraco!'
      @output.puts 'Jogador, digite o seu nome:'

      @player = create_new_player(@input.gets)
      
      @output.puts "Oi #{@player.name}!"

      @deck = Deck.new
    end

    def init(team1, team2, deck=Deck.new)
      @teams << team1
      @teams << team2

      @deck = deck

      @state_machine.next
    end

    def teams
      @teams
    end

    def shuffle_deck
      @deck.shuffle
    end

    def create_new_player(player_name)
      player = Buraco::Player.new(player_name)
    end

    def give(cards_quantity, options={})
      to = options[:to]
      to = to.hand_cards if to.is_a? Player

      (1..cards_quantity).each do |c|
        to << @deck.pop_card 
      end
    end

    def update(status, state)
      if state == :shuffle_deck
        @deck.shuffle
        @state_machine.next
      end

      if state == :give_dead_cards
        give_dead_cards
      end
    end

    def give_dead_cards
      2.times do
        cards = Array.new
        (1..11).each { |c| cards << @deck.pop_card }
        @dead_cards << cards
      end
    end

  end
end
