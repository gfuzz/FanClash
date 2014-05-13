class GamesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  # Lists all the games
  def index
    @games = Game.all.sort_by { |game| game.start_time }
  end

  # Checks if user is signed in, they can buy-in and view a game to submit.
  def show
    if user_signed_in?
      game_id = params[:id]
      @drafted_players = DraftedPlayer.where(game_id: game_id).order(:tier)
      @game = Game.find(game_id)

      if ParticipatingUser.where(game_id: @game.id, user_id: current_user.id)
        @selections = DraftPick.where(user_id: current_user.id)
        @selection_ids = @selections.map {|s| s.drafted_player_id }
      end

      if @game
        if @game.start_time < DateTime.now
          redirect_to "/games/live?id=#{@game.id}"
        else
          render action: :show
        end
      else
        render file: 'public/404', status: 404, formats: [:html]
      end
    else
      flash[:alert] = 'You need to sign in or create an account in order to play.'
      redirect_to '/'
    end
  end

  def live
    if user_signed_in?
      game_id = params[:id]
      @game = Game.find(game_id)

      # Gets our current users picks for the game
      @userPicks = Game.getUsersPicks(current_user.id, game_id)

      # Gets all of the users in the game.
      @userList = Game.getAllUsersForGame(game_id)

      # Lists all the drafted players for a game.
      @draftedPlayerList = Game.getDraftedPlayers(game_id)

      # Takes URL of each player, puts it in array, then takes out the duplicates.
      @allDraftedPlayersURL = Game.getAllDraftedPlayersURL(game_id)

      # Scraps the data from each players URL and stores in an array.
      @playerStatsData = Game.scrapData(@allDraftedPlayersURL)

      # Checks to see if all the games are over and returns a true or false value.
      @gamesOver = Game.checkGamesOver

      # If all games are over equals true then it gets the winners.
      if @gamesOver == true
        @winners = Game.getWinners(game_id)
      end

      # @theUsersPicks = Game.getUsersPicks()

      @playerStatsDataArray = Game.sortScrap(@draftedPlayerList, @playerStatsData)

      if @game && @game.start_time < DateTime.now
        render action: :live
      else
        render file: 'public/404', status: 404, formats: [:html]
      end
    end
  end

  def getuser
    theUser = params[:user]
    game_id = params[:id]
    @game = Game.find(game_id)

    @theUserObject =  (theUser)

    @userPicks = []
    allUsersPicks = DraftPick.where(user_id: @theUserObject.id)
    allUsersPicks.each do |pick|
      searchDraftedPlayer = DraftedPlayer.where(id: pick.drafted_player_id, game_id: game_id)[0]
      @userPicks << Player.where(id: searchDraftedPlayer.player_id)[0]
    end

    if theUser
      render action: :getuser
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

end
