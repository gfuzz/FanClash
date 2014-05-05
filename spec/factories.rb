FactoryGirl.define do
  factory :user do
    first_name "Jose"
    last_name   "Borja"
    username 		"chakaitos"
    email    		"chakaitos@fanclash.com"
    password 		"password"
    password_confirmation "password"
  end
end