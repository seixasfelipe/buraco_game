require 'spec_helper'

module Buraco
  describe Game do
    describe "#start" do
      it "exibe mensagem de boa vinda" do
        output = double('output')
        game = Game.new(output)

        output.should_receive(:puts).with('Bem vindo ao jogo de Buraco!')

        game.start
      end

      it "solicita o nome do jogador"
    end
  end
end
