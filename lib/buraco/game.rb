module Buraco
  class Game
    def initialize(output)
      @output = output
    end

    def start
      @output.puts 'Bem vindo ao jogo de Buraco!'
      @output.puts 'Jogador, digite o seu nome:'
    end
  end
end
