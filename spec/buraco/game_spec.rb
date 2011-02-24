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

    describe "#shuffle deck" do

      it "deveria ter 1 deck com 2 baralhos"
      it "deveria ter cartas de A a K sem o Joker"
      it "deveria ordenar o baralho"
      it "deveria embaralhar as cartas"

    end

    describe "#play" do
    
      let(:input) { double('input').as_null_object }
      let(:output) { double('output').as_null_object }
      let(:game) { Game.new(output, input) }

      before(:each) do
        input.should_receive(:gets).and_return('Josicreia')

        game.start
      end


      it "so comeca o jogo com pelo menos 1 jogador" do
        game.player.should_not be_nil
      end

      it "o jogador comeca sem cartas na mao" do
        game.player.hand_cards.should be_empty
      end

      it "o jogador recebe 11 cartas" do
        game.give 11, :to => game.player
        game.player.hand_cards.should have_exactly(11).items
      end

    end

  end
end
