require "test_helper"

class InstitutionItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get institution_items_index_url
    assert_response :success
  end
end
