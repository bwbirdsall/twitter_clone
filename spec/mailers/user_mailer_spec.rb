require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    user = FactoryGirl.create(:user)
    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      mail.subject.should eq("Hello new friend!")
      mail.to.should eq([user.email])
      mail.from.should eq(["hello@pseudotwitter.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
