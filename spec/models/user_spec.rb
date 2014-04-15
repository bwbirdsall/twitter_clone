require 'spec_helper'

describe User do
  it { should have_many :tweets }

  it 'sends a welcome email' do
    user = FactoryGirl.build(:user)
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end

  it 'sends a mention email' do
    tweeter = FactoryGirl.create(:user, :id => 2)
    tweetee = FactoryGirl.create(:user, :id => 3)
    tweet = FactoryGirl.build(:tweet, :user_id => tweeter.id, :content => "I, @#{tweeter.handle}, simply abhor @#{tweetee.handle}.")
    expect(UserMailer).to receive(:mention_email).with(tweetee, tweet)
    tweet.mentions
  end
end
