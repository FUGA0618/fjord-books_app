# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = create(:alice)
    @bob = create(:bob)
  end

  test '#name_or_email' do
    @bob.name = ''
    assert_equal @bob.email, @bob.name_or_email

    @bob.name = 'bob'
    assert_equal @bob.name, @bob.name_or_email
  end

  test '#followed_by?' do
    assert_not @alice.followed_by?(@bob)
    @bob.follow(@alice)
    assert @alice.followed_by?(@bob)
  end

  test '#follow_and_#following' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
    relationship = create(:relationship)
    carol = relationship.following
    dave = relationship.follower

    assert dave.following?(carol)
    dave.unfollow(carol)
    assert_not dave.following?(carol)
  end
end
