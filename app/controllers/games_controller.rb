class GamesController < ApplicationController
  # Lists all the games
  def index
  @games = Game.all
  end

  # Checks if user is signed in, they can buy-in and view a game to submit.
  def show
    if user_signed_in?

      @drafted_players = DraftedPlayer.where(game_id: params[:id]).order(:tier)
      @game_id = params[:id]

      # @tiers = []
      # (0...5).each do |tier_num|
      #   @tiers[tier_num] = DraftedPlayer.where(game_id: params[:id], tier: tier_num)
      # end

      # @tiers == [
      #   [player1, player2],
      #   [player3, player4],
      #   [player5, player6],
      #   [player7, player8],
      #   [player9, player10]
      # ]

      # drafted_player = @tiers[4][1]
      # player = drafted_player.player.player_name

      # The following grabs each player object and sets it to a variable
      # tierplayer1 = @tier1[0]
      # tierplayer2 = @tier1[1]
      # tierplayer3 = @tier2[0]
      # tierplayer4 = @tier2[1]
      # tierplayer5 = @tier3[0]
      # tierplayer6 = @tier3[1]
      # tierplayer7 = @tier4[0]
      # tierplayer8 = @tier4[1]
      # tierplayer9 = @tier5[0]
      # tierplayer10 = @tier5[1]

      # This takes the player object and searches each player in the drafted players
      # and the players database.
      # for x in (1..10) do
      #   eval "\@drafted_player#{x} = DraftedPlayer.find(tierplayer#{x}.id)"
      #   eval "\@player#{x} = Player.find(@drafted_player#{x}.player_id)"
      # end

      @game = Game.find(params[:id])

      if ParticipatingUser.where(game_id: @game.id, user_id: current_user.id)
        # @draftedPlayers = DraftedPlayer.where(game_id: @game.id)
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
