require 'spec_helper'

module Buraco
  describe StateMachine do
    
    let(:state_machine) { StateMachine.new }

    describe "#game states" do

      it "deveria ter criar novo deck como primeiro estado" do
        state_machine.current.should be_eql :new_deck
      end

      it "deveria embaralhar as cartas do deck APOS te-lo criado" do
        state_machine.next
        state_machine.current.should be_eql :shuffle_deck
      end

      it "deveria distribuir os 2 mortos APOS embaralhar o deck" do
        2.times { state_machine.next }
        state_machine.current.should be_eql :give_dead_cards
      end

      it "deveria distribuir as cartas aos jogadores APOS distribuir o morto" do
        3.times { state_machine.next }
        state_machine.current.should be_eql :give_players_cards
      end

      it "deveria comecar o jogo APOS distribuir o morto" do
        4.times { state_machine.next }
        state_machine.current.should be_eql :start_game
      end

      it "deveria permanecer no mesmo estado caso nao exista o estado solicitado" do
        state_machine.current.should be_eql :new_deck
        state_machine.next :invalid_state
        state_machine.current.should be_eql :new_deck
      end

      it "deveria contar os pontos quando o jogo terminar" do
        state_machine.skip_to :end_game
        state_machine.next

        state_machine.current.should be_eql :calculate_points
      end
    end


    describe "#player states" do

      it "deveria comprar uma carta pelo jogador da vez" do
        state_machine.skip_to :start_game
        state_machine.next

        state_machine.current.should be_eql :draw_card
      end

      it "deveria descer um jogo OU descartar uma carta APOS comprar uma carta" do
        state_machine.skip_to :draw_card
        state_machine.next
        
        state_machine.current.should be_eql [:play_cards, :discard_card]
      end

      it "deveria mudar de jogador OU terminar o jogo OU comprar o morto \
          APOS descartar uma carta" do
        state_machine.skip_to :draw_card
        state_machine.next :discard_card

        state_machine.current.should be_eql [:change_player, :end_game, 
          :draw_dead_cards]
      end

      it "deveria descer um jogo OU descartar uma carta OU comprar o morto \
          OU terminar o jogo APOS descer um jogo" do
        state_machine.skip_to :draw_card
        state_machine.next :play_cards

        state_machine.current.should be_eql [:play_cards, :discard_card, 
          :draw_dead_cards, :end_game]
      end

      it "deveria descer um jogo OU descartar uma carta APOS comprar o morto" do
        state_machine.skip_to :draw_dead_cards
        state_machine.next

        state_machine.current.should be_eql [:play_cards, :discard_card]
      end

    end
  end
end
