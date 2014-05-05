require 'spec_helper'

describe ProfilesController do

  before { visit sign_in_path }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in(user) }

  describe "GET 'show'" do
    it "returns a profile based on username" do
      get :show, id: user.username
      response.status.should eq(200)
    end

    it "render a 404 on profile not found" do
      get :show, id: "nothing"
      response.status.should eq(404)
    end
  end

end
