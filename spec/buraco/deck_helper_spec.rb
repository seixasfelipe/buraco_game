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

    describe "#create_cards" do
      it "deveria criar cartas de A a K dado um naipe - copas" do
        cards = DeckHelper.create_cards :of => :hearts
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards :of => :hearts
      end

      it "deveria criar cartas de A a K dado um naipe - ouros" do
        cards = DeckHelper.create_cards :of => :diamonds
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards :of => :diamonds
      end

      it "deveria criar cartas de A a K dado um naipe - paus" do
        cards = DeckHelper.create_cards :of => :clubs
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards :of => :clubs
      end

      it "deveria criar cartas de A a K dado um naipe - espadas" do
        cards = DeckHelper.create_cards :of => :spades
        cards.should have_exactly(13).cards
        cards.should be_eql get_cards :of => :spades
      end
    end

    describe "#manipulate_cards" do
      it "deveria ordenar as cartas"
      it "deveria selecionar cartas de um dado naipe"
    end

  end
end
