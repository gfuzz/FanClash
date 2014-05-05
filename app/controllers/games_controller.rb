class GamesController < ApplicationController
  # Lists all the games
  def index
    @games = Game.all
  end

  def show
  end

  def update
  end
end
