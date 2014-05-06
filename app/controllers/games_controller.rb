class GamesController < ApplicationController
  # Lists all the games
  def index
    @games = Game.all
  end

  def show
  	if user_signed_in?

	  	@players = DraftedPlayer.where(game_id: params[:id])
	    @game_id = params[:id]

	    start_place = 1
	    end_place = 5

	    while start_place <= end_place do
	      instance_variable_set "@tier#{start_place}",  DraftedPlayer.where(game_id: params[:id], tier: start_place)
	      start_place += 1
	    end

	  	@game = Game.find(params[:id])
	  	if @game
	  		render action: :show
	  	else
		  	render file: 'public/404', status: 404, formats: [:html]
		  end
		else
			flash[:alert] = 'You need to sign in or create an account in order to play.'
			redirect_to '/'
		end
  end
end
