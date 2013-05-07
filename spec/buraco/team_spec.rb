require 'spec_helper'

module Buraco
  describe Team do

    before :each do
      @player1 = Player.new "Marotinus"
      @player2 = Player.new "Moulin"
      @team = Team.new @player1, @player2
    end

    it 'deveria comecar com pontos 0' do
      @team.points.should be_eql 0
    end

    it 'deveria ter somente 1 jogador' do
      @team = Team.new @player1
      @team.players.should have_exactly(1).player
    end

    it 'deveria ter 2 jogadores' do
      @team.players.should have_exactly(2).players
    end

    it 'deveria adicionar 10 pontos pro time' do
      @team.add_points 10
      @team.points.should be_eql 10
    end

    it 'deveria remover 50 pontos do time' do
      @team.add_points 10
      @team.add_points -50
      @team.points.should be_eql -40
    end
  end
end