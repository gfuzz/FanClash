# # test/mailers/user_game_status_mailer_test.rb
# #
# require 'test_helper'

# class UserGameStatusMailerTest < ActionMailer::TestCase
#   test "game_started" do

#     user = User.create({
#                         first_name: "Test",
#                         last_name: "User",
#                         username: "testuser1",
#                         email: "hello123@test1.com",
#                         password: "password",
#                         password_confirmation: "password"
#                       })
#     game = Game.create({
#                         sport: "Test Basketball",
#                         prizes: 500,
#                         buy_in: 2,
#                         current_entries: 0,
#                         allowed_entries: 100
#                       })

#     # Construct the email
#     email = UserGameStatusMailer.game_started(user.id, game.id)
#     # Then send it
#     email.deliver

#     # This ensures the email was delivered
#     assert_not ActionMailer::Base.deliveries.empty?

#     # Ensure proper postage
#     assert_equal ['me@example.com'], email.from
#     assert_equal ['friend@example.com'], email.to

#     # Ensure subject contains key information
#     assert_includes email.subject, user.first_name
#     assert_match(/has started/i, email.subject) # i means case-insensitive

#     # Ensure the body of the sent email contains key information
#     assert_includes email.body.to_s, user.first_name
#     assert_includes email.body.to_s, game.sport
#   end
# end


