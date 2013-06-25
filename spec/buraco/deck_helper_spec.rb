require 'spec_helper'

module Buraco
  describe DeckHelper do

    def get_cards(options = {})
      cards = (1..13).map { |i| Card.new(options[:of], i)}
    end

    def cards_expectation_of(suit)
        cards = DeckHelper.create_cards of: suit
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards of: suit
    end

    describe "#create_cards" do
      it "should create cards from A to K of a given suit - hearts" do
        cards_expectation_of(:hearts)
      end

      it "should create cards from A to K of a given suit - diamonds" do
        cards_expectation_of(:diamonds)
      end

      it "should create cards from A to K of a given suit - clubs" do
        cards_expectation_of(:clubs)
      end

      it "should create cards from A to K of a given suit - spades" do
        cards_expectation_of(:spades)
      end
    end

    describe "#manipulate_cards" do

      it "should select cards of a given suit" do
        cards =  get_cards of: :hearts
        cards.concat get_cards of: :clubs

        selected_cards = DeckHelper.select cards, of: :clubs
        
        selected_cards.should have_exactly(13).cards
        selected_cards.map do |c|
          c.suit.should be_eql :clubs
        end
      end

      it "should select no cards if a given suit doesnt exist in the collection" do
        cards = get_cards of: :hearts

        selected_cards = DeckHelper.select cards, of: :clubs
        selected_cards.should have_exactly(0).cards
        
        selected_cards = DeckHelper.select cards, of: :diamonds
        selected_cards.should have_exactly(0).cards
      
        selected_cards = DeckHelper.select cards, of: :spades
        selected_cards.should have_exactly(0).cards
      end
      
      it "should order cards" do
        cards =  get_cards of: :hearts
        cards.concat get_cards of: :clubs
        cards.concat get_cards of: :diamonds
        cards.concat get_cards of: :spades

        new_cards = cards.clone
        new_cards.should be_eql cards

        new_cards.shuffle!
        new_cards.should_not be_eql cards

        new_cards = DeckHelper.sort(cards)
        new_cards.should be_eql cards
      end
    end

  end
end
