require 'spec_helper'

module Buraco
  describe DeckHelper do

    def get_cards(options = {})
      cards = [
          Card.new(options[:of], 1), 
          Card.new(options[:of], 2), 
          Card.new(options[:of], 3), 
          Card.new(options[:of], 4), 
          Card.new(options[:of], 5), 
          Card.new(options[:of], 6), 
          Card.new(options[:of], 7), 
          Card.new(options[:of], 8), 
          Card.new(options[:of], 9), 
          Card.new(options[:of], 10),
          Card.new(options[:of], 11),
          Card.new(options[:of], 12),
          Card.new(options[:of], 13)
      ]
    end

    def cards_expectation_of(suit)
        cards = DeckHelper.create_cards :of => suit
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards :of => suit
    end

    describe "#create_cards" do
      it "deveria criar cartas de A a K dado um naipe - copas" do
        cards_expectation_of(:hearts)
      end

      it "deveria criar cartas de A a K dado um naipe - ouros" do
        cards_expectation_of(:diamonds)
      end

      it "deveria criar cartas de A a K dado um naipe - paus" do
        cards_expectation_of(:clubs)
      end

      it "deveria criar cartas de A a K dado um naipe - espadas" do
        cards_expectation_of(:spades)
      end
    end

    describe "#manipulate_cards" do
      it "deveria ordenar as cartas"
      it "deveria selecionar cartas de um dado naipe"
    end

  end
end
