class DraftPicksController < ApplicationController
  def create
    newParams = params.slice(:tier1, :tier2, :tier3, :tier4, :tier5)
    player_check = newParams[:tier1].to_i

    if User.find(current_user.id).draft_picks.find(player_check).drafted_player.game_id
      redirect_to "/"
    else

    newParams.each do |choice|
      player_choice = choice[1].to_i
      DraftPick.create({:user_id => current_user.id, :drafted_player_id => player_choice})
    end
    # newUser = ParticipatingUser.create({:user_id => current_user.id, :game_id => })

    redirect_to "/draft_picks/index"
    # @game = Game.find(params[:id])
    # if @game.update(params)
    # else
    #   render :show
    # end
    end
  end
end
