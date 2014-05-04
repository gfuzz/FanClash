require 'spec_helper'

describe ProfilesController do

	before { @user = User.new(first_name: "Jose", 
  													last_name: "Borja", 
  													username: "chakaitos", 
  													email: "chakaitos@fanclash.com",
  													password: "password", 
  													password_confirmation: "password") }

  describe "GET 'show'" do
    it "returns a profile based on username" do
      get :show, id: @user.username
      response.status.should eq(200)
    end

    it "render a 404 on profile not found" do
      get :show, id: "nothing"
      response.status.should eq(404)
    end
  end

end
