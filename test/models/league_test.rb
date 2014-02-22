require 'test_helper'
class LeagueTest < ActiveSupport::TestCase
  test "return a CURRENT list of champions" do
    new_champ = ENV["NEW_CHAMP"]
    l = League.new
    assert l.champion_names.include?(new_champ), "Champion list is missing #{ENV["NEW_CHAMP"]} and possibly more..."
  end
  #TODO: must update mysql database with the new items from presason patch
  test "return a CURRENT list of items" do
    new_item = ENV["NEW_ITEM"]
    l = League.new
    assert l.item_names.include?(new_item), "Most recent item patch with [#{ENV["NEW_ITEM"]}] not included."
  end

  test "lookup item image" do
    l = League.new
    assert_equal(l.get_item_image("Doran's Blade"), "1055.png", "Could not look up doran's blade ...")
  end

  test "lookup champion image" do
    l = League.new
    cl = l.champion_names
    cl.each do |f|
      assert(l.get_champion_image(f), "Could not look up #{f} ...")
    end
  end
end
