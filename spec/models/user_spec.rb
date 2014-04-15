require 'spec_helper'

describe User do
  it { should have_many :tweets }

  it 'sends a welcome email' do
    user = FactoryGirl.build(:user)
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end
end
