class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_username(params[:id])
  	# binding.pry
  	if @user
  		render action: :show
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
	  end
  end
end
