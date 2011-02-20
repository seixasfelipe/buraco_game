module Buraco
  class Game

    attr_accessor :player  

    def initialize(output, input)
      @output = output
      @input = input
    end

    def start
      @output.puts 'Bem vindo ao jogo de Buraco!'
      @output.puts 'Jogador, digite o seu nome:'

      @player = create_new_player(@input.gets)
      
      @output.puts "Oi #{@player.name}!"
    end

    def create_new_player(player_name)
      player = Buraco::Player.new(player_name)
    end


  end
end
