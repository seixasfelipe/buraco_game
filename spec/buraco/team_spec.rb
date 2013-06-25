require 'spec_helper'

module Buraco
  describe Team do

    before :each do
      @player1 = Player.new "Marotinus"
      @player2 = Player.new "Moulin"
      @team = Team.new @player1, @player2
    end

    it 'should start with 0 points' do
      @team.points.should be_eql 0
    end

    it 'should have one player' do
      @team = Team.new @player1
      @team.players.should have_exactly(1).player
    end

    it 'should have two players' do
      @team.players.should have_exactly(2).players
    end

    it 'should put players inside team' do
      @team.players[0].name.should be_eql @player1.name
      @team.players[1].name.should be_eql @player2.name
    end

    it 'should add 10 points to team' do
      @team.add_points 10
      @team.points.should be_eql 10
    end

    it 'should remove 50 points to team' do
      @team.add_points 10
      @team.add_points -50
      @team.points.should be_eql -40
    end
  end
end