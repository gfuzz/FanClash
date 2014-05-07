class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_username(params[:id])
  	if @user
  		user = ParticipatingUser.where(:user_id => current_user.id)
		  @game_ids = []
		  user.each do |e|
		    @game_ids << e.game_id
		  end
		  @games = []
		  @game_ids.each do |game_id|
		    @games << Game.find(game_id)
		  end
  		render action: :show
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
	  end
  end
end
