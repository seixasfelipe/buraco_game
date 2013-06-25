require 'spec_helper'

module Buraco
  describe Game do

    let(:team1) { Team.new(Player.new "Marotinus") }
    let(:team2) { Team.new(Player.new "GrandMoulin") }
    let(:input) { double(:input).as_null_object }
    let(:output) { double(:output).as_null_object }
    let(:game) { Game.new(output, input) }

    describe "#start" do
      
      it "show welcome message" do
        output.should_receive(:puts).with('Bem vindo ao jogo de Buraco!')

        game.start
      end

      it "asks for player name" do
        output.should_receive(:puts).with('Jogador, digite o seu nome:')

        game.start
      end

      it "gets player name" do
        input.should_receive(:gets).and_return('Josicreia')
        
        game.start
      end

      it "shows message with player name" do
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


      it "only starts game at least with one player" do
        game.player.should_not be_nil
      end

      it "player starts with no cards in the hand" do
        game.player.hand_cards.should be_empty
      end

      it "player receives 11 cards" do
        game.give 11, to: game.player
        game.player.hand_cards.should have_exactly(11).items
      end

      it "should pop cards from deck top when distributing it" do
        count = game.deck.count
        cards_num = 1
        game.give cards_num, to: game.player
        game.deck.count.should == (count - cards_num)
      end

    end

    describe "#players" do

      it "should have 2 teams of players" do
        game.init team1, team2
        
        game.teams.should have_exactly(2).teams
        game.teams[0].should be_eql team1
        game.teams[1].should be_eql team2
      end

    end

    describe "#state changes" do

      describe "#observe state changes" do
        it "should register the Game as observer of state machine" do
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

        it "should shuffle deck when the game starts" do
          deck = Deck.new
          deck.should_receive(:shuffle)

          game.init team1, team2, deck
        end

        it "should give dead cards deck when the game starts" do
          init_game

          game.dead_cards.should have_exactly(2).piles
          game.dead_cards[0].should have_exactly(11).cards
          game.dead_cards[1].should have_exactly(11).cards
        end

      end 

    end



  end
end
