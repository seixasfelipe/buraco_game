module Buraco
  class Game
  
    def initialize(output, input)
      @output = output
      @input = input
    end

    def start
      @output.puts 'Bem vindo ao jogo de Buraco!'
      @output.puts 'Jogador, digite o seu nome:'

      player_name = @input.gets
      @output.puts "Oi #{player_name}!"
    end
  end
end
