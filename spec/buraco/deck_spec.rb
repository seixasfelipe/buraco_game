require 'spec_helper'

module Buraco
  describe Deck do

    let(:deck) { Deck.new }

    describe "#shuffle" do

      it "deveria ter 1 deck com 2 baralhos com 52 cartas cada" do
        deck.count.should == 104
      end
      
      it "cada carta do deck deveria ser do tipo Buraco::Card" do
        deck.cards[0].should be_is_a Buraco::Card
      end

      it "deveria ter no deck 26 cartas do naipe - copas" do
        cards = DeckHelper.select deck.cards, :of => :hearts
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - ouros" do
        cards = DeckHelper.select deck.cards, :of => :diamonds
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - paus" do
        cards = DeckHelper.select deck.cards, :of => :clubs
        cards.should have_exactly(26).cards
      end

      it "deveria ter no deck 26 cartas do naipe - espadas" do
        cards = DeckHelper.select deck.cards, :of => :spades
        cards.should have_exactly(26).cards
      end

      it "deveria ter as cartas desembaralhadas quando o deck for criado" do
        deck.shuffled?.should be_false
      end

    end

  end
end
