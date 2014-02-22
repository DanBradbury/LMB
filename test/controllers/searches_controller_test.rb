require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "valid search returns results" do
    get(:results, {:name => 'isixpool'})
    assert_template :results
  end

  test "empty search returns not found" do
    get(:results, {:name => ''})
    assert_template :not_found
  end

  test "create new search" do
    post :create, search: {name: 'isixpool'}
    assert_redirected_to(controller: "searches", action: :results, name: 'isixpool')
  end

  test "search for champion list" do
    get :champions
    assert_template :champions
  end

  test "verify client" do
    get :client_check
    assert_response(:success)
  end

  test "get challenger league 3s" do
    get :challenger_tt
    assert_response(:success)
  end

  test "get challenger league solo 5s" do
    get :challenger_solo_sr
    assert_response(:success)
  end
end
