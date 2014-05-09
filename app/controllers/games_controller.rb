class GamesController < ApplicationController
  # Lists all the games
  def index
  @games = Game.all.sort_by { |game| game.start_time }
  end

  # Checks if user is signed in, they can buy-in and view a game to submit.
  def show
    if user_signed_in?

      @drafted_players = DraftedPlayer.where(game_id: params[:id]).order(:tier)
      @game_id = params[:id]

      @game = Game.find(params[:id])

      if ParticipatingUser.where(game_id: @game.id, user_id: current_user.id)
        @selections = DraftPick.where(user_id: current_user.id)
        @selection_ids = @selections.map {|s| s.drafted_player_id }
      end

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
