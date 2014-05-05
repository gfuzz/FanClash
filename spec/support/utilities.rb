
def sign_in(user)
  visit sign_in_path
  fill_in "user[login]",    with: user.username
	fill_in "user[password]", with: user.password
  click_button "Sign In"
end