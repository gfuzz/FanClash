class GamesController < ApplicationController
  # Lists all the games
  def index
    @games = Game.all
  end

  def show
  	@players = DraftedPlayer.where(game_id: params[:id])
  	@game = Game.find(params[:id])
  	if @game
  		render action: :show
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
	  end
  end

  def update
  end
end
