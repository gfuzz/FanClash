class DraftPicksController < ApplicationController
  def create
    newParams = params.slice(:tier1, :tier2, :tier3, :tier4, :tier5)
    player_check = newParams[:tier1].to_i
    game_id = DraftedPlayer.find(player_check).game_id


    ActiveRecord::Base.connection.execute("DELETE FROM draft_picks WHERE id in (SELECT draft_picks.id FROM users INNER JOIN draft_picks ON users.id = draft_picks.user_id INNER JOIN drafted_players ON draft_picks.drafted_player_id = drafted_players.id WHERE user_id = #{current_user.id} AND drafted_players.game_id = #{game_id})")

    if ParticipatingUser.where(user_id: current_user.id, game_id: game_id).count == 0
      pu = ParticipatingUser.new(user_id: current_user.id, game_id: game_id)
      pu.save
    end

    newParams.each do |choice|
      player_choice = choice[1].to_i
      DraftPick.create({:user_id => current_user.id, :drafted_player_id => player_choice})
    end
    # newUser = ParticipatingUser.new({:user_id => current_user.id, :game_id => User.find(current_user.id).draft_picks.find(player_check).drafted_player.game_id})
    # newUser.save

    redirect_to "/draft_picks/index"
    # @game = Game.find(params[:id])
    # if @game.update(params)
    # else
    #   render :show
    # end
  end
end

