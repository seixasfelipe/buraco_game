require 'spec_helper'

module Buraco
  describe StateMachine do
    describe "#states" do

      let(:state_machine) { StateMachine.new }

      it "deveria ter criar novo deck como primeiro estado" do
        state_machine.current.should be_eql :new_deck
      end

      it "deveria embaralhar as cartas do deck apos te-lo criado" do
        state_machine.next
        state_machine.current.should be_eql :shuffle_deck
      end

    end
  end
end
