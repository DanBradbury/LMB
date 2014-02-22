require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "dont allow blank review" do
    r = Review.new
    assert !r.valid?
  end

  test "valid minimal review" do
    r = Review.new(:ranking => 0, :player_id => 1)
    assert r.valid?
  end
end
