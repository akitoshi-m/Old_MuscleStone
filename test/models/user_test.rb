require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    takashi = users(:takashi)
    satomi  = users(:satomi)
    assert_not takashi.following?(satomi)
    takashi.follow(satomi)
    assert takashi.following?(satomi)
    assert satomi.followers.include?(takashi)
    takashi.unfollow(satomi)
    assert_not takashi.following?(satomi)
  end
end
