require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "Jose", 
  													last_name: "Borja", 
  													username: "chakaitos", 
  													email: "chakaitos@fanclash.com",
  													password: "password", 
  													password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user.password = ""
      @user.password_confirmation = ""
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "#full_name" do
  	it "should return the first and last names of the user" do
  		expect(@user.full_name).to eq "#{@user.first_name} #{@user.last_name}"
  	end
  end
end