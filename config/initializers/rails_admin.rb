RailsAdmin.config do |config|

  # Adds actual player name to drop-down list in RailsAdmin instead of just stating Player1
  config.label_methods.unshift :player_name

  # Makes sure the user is signed in before accessing the admin page
  config.authenticate_with{
    unless current_user
      # session[:return_to] = request.url
      flash[:alert] = 'You need to be signed in and an admin to access the admin page.'
      redirect_to '/'
    end
  }

  # Makes sure the current user is actually an admin before allowing the to access admin page.
  config.authorize_with{
    redirect_to '/', :alert => "You are not authorized to access that page" unless current_user.admin?
  }

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

