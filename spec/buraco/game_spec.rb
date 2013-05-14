require 'spec_helper'

module Buraco
  describe Game do

    let(:team1) { Team.new(Player.new "Marotinus") }
    let(:team2) { Team.new(Player.new "GrandMoulin") }
    let(:input) { double(:input).as_null_object }
    let(:output) { double(:output).as_null_object }
    let(:game) { Game.new(output, input) }

    describe "#start" do
      
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
        game.give 11, to: game.player
        game.player.hand_cards.should have_exactly(11).items
      end

      it "deveria sair do topo do deck as cartas distribuidas" do
        count = game.deck.count
        cards_num = 1
        game.give cards_num, to: game.player
        game.deck.count.should == (count - cards_num)
      end

    end

    describe "#players" do

      it "deveria ter 2 times de jogadores" do
        game.init team1, team2
        
        game.teams.should have_exactly(2).teams
        game.teams[0].should be_eql team1
        game.teams[1].should be_eql team2
      end

    end

    describe "#state changes" do

      describe "#observe state changes" do
        it "deveria registrar o Game como observador das mudancas de estado" do
          state_machine = double(:state_machine).as_null_object

          state_machine.should_receive(:add_observer).with(kind_of(Game))

          new_game = Game.new input, output, state_machine
        end
      end

      describe "#do changes" do

        def init_game
          deck = Deck.new
          game.init team1, team2, deck
        end

        it "deveria embaralhar o baralho quando o jogo iniciar" do
          deck = Deck.new
          deck.should_receive(:shuffle)

          game.init team1, team2, deck
        end

        it "deveria separar o morto quando o jogo iniciar" do
          init_game

          game.dead_cards.should have_exactly(2).piles
          game.dead_cards[0].should have_exactly(11).cards
          game.dead_cards[1].should have_exactly(11).cards
        end

      end 

    end



  end
end
