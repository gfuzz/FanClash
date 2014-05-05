require 'spec_helper'

describe "Authentication" do

  subject { page }
 
  describe "Sign Up" do

    before { visit sign_up_path }

    let(:submit) { "Create User" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user[first_name]",   				 with: "Jose"
        fill_in "user[last_name]",    				 with: "Borja"
        fill_in "user[username]",     				 with: "chakaitos"
        fill_in "user[email]",        				 with: "chakaitos@chakaitos.com"
        fill_in "user[password]",     				 with: "password"
        fill_in "user[password_confirmation]", with: "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
	end

	describe "Sign In" do
    before { visit sign_in_path }
  
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in(user) } # see 'spec/support/utilities.rb' for sign_in method

      it { should have_link("#{user.full_name}", href: edit_user_registration_path) }
      it { should have_link('Sign Out',    			 href: destroy_user_session_path) }
      it { should_not have_link('Sign In', 			 href: sign_in_path) }
    end

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_link("Sign Up",      href: sign_up_path) }
      it { should have_link('Sign In',      href: sign_in_path) }
      it { should_not have_link('Sign Out', href: destroy_user_session_path) }
    end
  end
end