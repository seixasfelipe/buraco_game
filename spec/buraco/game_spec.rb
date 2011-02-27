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
      
      let(:input) { double('input').as_null_object }
      let(:output) { double('output').as_null_object }
      let(:game) { Game.new(output, input) }


      before(:each) do
        input.should_receive(:gets).and_return('Josicreia')

        game.start
      end

      it "deveria ter 1 deck com 2 baralhos com 52 cartas cada" do
        game.deck.count.should == 104
      end
      
      it "cada carta do deck deveria ser do tipo Buraco::Card" do
        game.deck.cards[0].should be_is_a Buraco::Card
      end

      it "deveria ter no deck 26 cartas do naipe - copas" do
        cards = DeckHelper.select game.deck.cards, :of => :hearts
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - ouros" do
        cards = DeckHelper.select game.deck.cards, :of => :diamonds
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - paus" do
        cards = DeckHelper.select game.deck.cards, :of => :clubs
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - espadas" do
        cards = DeckHelper.select game.deck.cards, :of => :spades
        cards.should have_exactly(26).cards
      end

      it "deveria ter as cartas desembaralhadas quando o deck for criado" do
        game.deck.shuffled?.should be_false
      end

      it "deveria embaralhar as cartas" do
        initial_cards = game.deck.cards.clone
        game.deck.shuffle
        game.deck.shuffled?.should be_true
        game.deck.cards.should_not be_eql initial_cards
      end

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

      it "deveria sair do topo do deck as cartas distribuidas" do
        count = game.deck.count
        cards_num = 1
        game.give cards_num, :to => game.player
        game.deck.count.should == (count - cards_num)
      end

    end

  end
end
