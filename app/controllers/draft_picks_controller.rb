class DraftPicksController < ApplicationController
  def index
  end

  def show
    user = ParticipatingUser.where(:user_id => current_user.id)
    @game_ids = []
    user.each do |e|
      @game_ids << e.game_id
    end
    @games = []
    @game_ids.each do |game_id|
      @games << Game.find(game_id)
    end
  end

  def create
    newParams = params.slice(:tier0, :tier1, :tier2, :tier3, :tier4)
    player_check = newParams[:tier1].to_i
    game_id = DraftedPlayer.find(player_check).game_id

    # This line deletes the users picks from the table draft_picks that is associated with that user and the game.
    ActiveRecord::Base.connection.execute("DELETE FROM draft_picks WHERE id in (SELECT draft_picks.id FROM users INNER JOIN draft_picks ON users.id = draft_picks.user_id INNER JOIN drafted_players ON draft_picks.drafted_player_id = drafted_players.id WHERE user_id = #{current_user.id} AND drafted_players.game_id = #{game_id})")

    # Adds a player to ParticipatingUser table, only if the player does not exist within this table and associated with the game they are submitting to.
    if ParticipatingUser.where(user_id: current_user.id, game_id: game_id).count == 0
      pu = ParticipatingUser.new(user_id: current_user.id, game_id: game_id)
      pu.save
    end

    # Takes the users picks and adds them to the DraftPick table.
    newParams.each do |choice|
      player_choice = choice[1].to_i
      DraftPick.create({:user_id => current_user.id, :drafted_player_id => player_choice})
    end

    # Redirects after successful submitting.
    redirect_to "/draft_picks/#{current_user.id}"
  end
end

