require 'spec_helper'

describe Follow do
  it "should belong to a follower" do
    user1 = FactoryGirl.create(:user, handle: 'user')
    user2 = FactoryGirl.create(:user, handle: 'follower')
    follow = Follow.create(user_id: user1.id, follower_id: user2.id)
    follow.follower.should eq user2
  end
end
