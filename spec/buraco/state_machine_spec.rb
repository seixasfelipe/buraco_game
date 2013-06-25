require 'spec_helper'

module Buraco
  describe StateMachine do
    
    let(:state_machine) { StateMachine.new }

    describe "#game states" do

      it "should create deck at inicial state" do
        state_machine.current.should be_eql :new_deck
      end

      it "should shuffle deck cards AFTER its creation" do
        state_machine.next
        state_machine.current.should be_eql :shuffle_deck
      end

      it "should distribute the 2 dead cards deck AFTER shuffle deck" do
        2.times { state_machine.next }
        state_machine.current.should be_eql :give_dead_cards
      end

      it "should distribute cards to players AFTER distribute dead cards deck" do
        3.times { state_machine.next }
        state_machine.current.should be_eql :give_players_cards
      end

      it "should start game AFTER distribute dead cards deck" do
        4.times { state_machine.next }
        state_machine.current.should be_eql :start_game
      end

      it "should change player when game starts" do
        state_machine.skip_to :start_game
        state_machine.next

        state_machine.current.should be_eql :change_player
      end

      it "should hold same state if a given state does not exist" do
        state_machine.current.should be_eql :new_deck
        state_machine.next :invalid_state
        state_machine.current.should be_eql :new_deck
      end

      it "should count points when the game ends" do
        state_machine.skip_to :end_game
        state_machine.next

        state_machine.current.should be_eql :calculate_points
      end
    end


    describe "#player states" do

      it "should buy one card by current player" do
        state_machine.skip_to :change_player
        state_machine.next

        state_machine.current.should be_eql :draw_card
      end

      it "should play cards OR discard one card AFTER buy one card" do
        state_machine.skip_to :draw_card
        state_machine.next
        
        state_machine.current.should be_eql [:play_cards, :discard_card]
      end

      it "should change player OR end game OR buy dead cards deck \
          AFTER discard one card" do
        state_machine.skip_to :draw_card
        state_machine.next :discard_card

        state_machine.current.should be_eql [:change_player, :end_game, 
          :draw_dead_cards]
      end

      it "should play cards OR discard one card OR buy dead cards deck \
          OR end game AFTER play cards" do
        state_machine.skip_to :draw_card
        state_machine.next :play_cards

        state_machine.current.should be_eql [:play_cards, :discard_card, 
          :draw_dead_cards, :end_game]
      end

      it "should play card OR discard one card AFTER buy dead cards deck" do
        state_machine.skip_to :draw_dead_cards
        state_machine.next

        state_machine.current.should be_eql [:play_cards, :discard_card]
      end
    end

    describe "#as observable" do

      it "should be observed whenever there is a state change" do
        state_observer = double(:state_observer).as_null_object
        
        state_observer.should_receive(:update).with(:state_changed, :shuffle_deck)

        state_machine.add_observer state_observer
        state_machine.next
      end

    end

  end
end
