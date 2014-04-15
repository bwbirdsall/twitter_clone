require 'spec_helper'
require 'pry'

describe User do
  it { should have_many :follows }
  it { should have_many :followers }
  it { should have_many :tweets }

  it 'should know how follows work' do
    user1 = FactoryGirl.create(:user, :handle => 'Bill')
    user2 = FactoryGirl.create(:user, :handle => 'Bob')
    Follow.create(:follower_id => user1.id, :user_id => user2.id)
    # binding.pry
    user2.followers.first.should eq user1

  end

  it { should allow_value('Mac32_Mac').for(:handle) }
  it { should_not allow_value('Mac32._Mac').for(:handle) }
  it { should_not allow_value('Mac32 _Mac').for(:handle) }

  it 'sends a welcome email' do
    user = FactoryGirl.build(:user)
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end

  it 'sends a mention email' do
    tweeter = FactoryGirl.create(:user)
    tweetee = FactoryGirl.create(:user)
    tweet = FactoryGirl.build(:tweet, :user_id => tweeter.id, :content => "I, @#{tweeter.handle}, simply abhor @#{tweetee.handle}.")
    expect(UserMailer).to receive(:mention_email).with(tweetee, tweet)
    tweet.mentions
  end
end
