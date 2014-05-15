class UserGameStatusMailer < ActionMailer::Base
  def game_started(user_id, game_id)
    # Standard Rails
    @user = User.find(user_id)
    @game = Game.find(game_id)
    # If want to include DraftPicks and DraftedPlayers
    # @DraftedPlayer = ...
    # @DraftPick = ...

    mail(
      from: "fanclash23@gmail.com",
      to: @user.email,
      subject: "Hey #{@user.first_name}, #{@game.sport} has started"
    )
  end
end
