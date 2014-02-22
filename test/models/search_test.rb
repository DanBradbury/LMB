require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "empty search not valid" do
    s = Search.new(:name => '')
    assert !s.valid?
  end

  test "valid search with name supplied" do
    s = Search.new(:name => 'isixpool')
    assert s.valid?
  end

  test "cleanup irregular name with caps" do
    s = Search.new(:name => 'ISixPool')
    assert_equal('isixpool', s.cleanup, "name must be downcased")
  end

  test "cleanup names with spaces" do
    s = Search.new(:name => "C9 Meteos")
    assert_equal( 'c9meteos', s.name, "spaces should be removed")
  end
end
