class GamesController < ApplicationController
  # Lists all the games
  def index
  @games = Game.all
  end

  # Checks if user is signed in, they can buy-in and view a game to submit.
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


      # The following grabs each player object and sets it to a variable
      tierplayer1 = @tier1[0]
      tierplayer2 = @tier1[1]
      tierplayer3 = @tier2[0]
      tierplayer4 = @tier2[1]
      tierplayer5 = @tier3[0]
      tierplayer6 = @tier3[1]
      tierplayer7 = @tier4[0]
      tierplayer8 = @tier4[1]
      tierplayer9 = @tier5[0]
      tierplayer10 = @tier5[1]

      # This takes the player object and searches each player in the drafted players
      # and the players database.
      for x in (1..10) do
        eval "\@drafted_player#{x} = DraftedPlayer.find(tierplayer#{x}.id)"
        eval "\@player#{x} = Player.find(@drafted_player#{x}.player_id)"
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
