require 'spec_helper'

describe "Profile Page" do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }
  before { visit "/#{user.username}" }

  it { should have_content(user.full_name) }
end
