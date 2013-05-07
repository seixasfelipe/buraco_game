module Buraco
  class Team

    def initialize(player1, player2=nil)
      @points = 0
      @players = []
      @players << player1
      @players << player2 unless player2 == nil
    end

    def players
      @players
    end

    def add_points(points)
      @points += points
    end

    def points
      @points
    end

  end
end