require 'spec_helper'

module Buraco
  describe Game do
    describe "#start" do
      
      let(:input) { double('input').as_null_object }
      let(:output) { double('output').as_null_object }
      let(:game) { Game.new(output, input) }

      it "exibe mensagem de boa vinda" do
        output.should_receive(:puts).with('Bem vindo ao jogo de Buraco!')

        game.start
      end

      it "solicita o nome do jogador" do
        output.should_receive(:puts).with('Jogador, digite o seu nome:')

        game.start
      end

      it "obtem o nome do jogador" do
        input.should_receive(:gets).and_return('Josicreia')
        
        game.start
      end

      it "exibe mensagem confirmando o nome do jogador" do
        output.should_receive(:puts).with('Oi Josicreia!')
        input.should_receive(:gets).and_return('Josicreia')
        
        game.start
      end
    end

    describe "#play" do
    
      let(:input) { double('input').as_null_object }
      let(:output) { double('output').as_null_object }
      let(:game) { Game.new(output, input) }

      it "so comeca o jogo com pelo menos 1 jogador" do
        input.should_receive(:gets).and_return('Josicreia')

        game.start

        game.player.should_not be_nil
      end

      it "o jogador comeca sem cartas na mao"
      it "o jogador recebe 11 cartas"
    end

  end
end
