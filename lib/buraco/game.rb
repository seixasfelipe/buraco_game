module Buraco
  class Game

    attr_accessor :player, :deck  

    def initialize(output, input)
      @output = output
      @input = input
      @teams = []
    end

    def start
      @output.puts 'Bem vindo ao jogo de Buraco!'
      @output.puts 'Jogador, digite o seu nome:'

      @player = create_new_player(@input.gets)
      
      @output.puts "Oi #{@player.name}!"

      @deck = Deck.new
    end

    def init team1, team2
      @teams << team1
      @teams << team2
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
      player = options[:to]

      (1..cards_quantity).each do |c|
        player.hand_cards << @deck.pick_card 
      end
    end

  end
end
