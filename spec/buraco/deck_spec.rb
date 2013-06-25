require 'spec_helper'

module Buraco
  describe Deck do

    let(:deck) { Deck.new }

    describe "#shuffle" do

      it "should have 1 deck with 2 full decks of cards (52 cards each)" do
        deck.count.should == 104
      end
      
      it "each deck card should be of Buraco::Card" do
        deck.cards[0].should be_is_a Buraco::Card
      end

      it "should have 26 cards of suit - hearts" do
        cards = DeckHelper.select deck.cards, :of => :hearts
        cards.should have_exactly(26).cards
      end

      it "should have 26 cards of suit - diamonds" do
        cards = DeckHelper.select deck.cards, :of => :diamonds
        cards.should have_exactly(26).cards
      end

      it "should have 26 cards of suit - clubs" do
        cards = DeckHelper.select deck.cards, :of => :clubs
        cards.should have_exactly(26).cards
      end

      it "should have 26 cards of suit - spades" do
        cards = DeckHelper.select deck.cards, :of => :spades
        cards.should have_exactly(26).cards
      end

      it "should have cards unshuffled during deck creation" do
        deck.shuffled?.should be_false
      end

      it "should shuffle cards" do
        initial_cards = deck.cards.clone
        deck.shuffle
        deck.shuffled?.should be_true
        deck.cards.should_not be_eql initial_cards
      end

    end

  end
end
