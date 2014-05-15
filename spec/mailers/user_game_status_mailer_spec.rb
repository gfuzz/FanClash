require "spec_helper"

describe UserGameStatus do
  describe "game_started" do
    let(:mail) { UserGameStatus.game_started }

    it "renders the headers" do
      mail.subject.should eq("Game started")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
