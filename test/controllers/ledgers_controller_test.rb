require "test_helper"

class LedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ledger = ledgers(:one)
  end

  test "should get index" do
    get ledgers_url, as: :json
    assert_response :success
  end

  test "should create ledger" do
    assert_difference('Ledger.count') do
      post ledgers_url, params: { ledger: { description: @ledger.description, metadata: @ledger.metadata, name: @ledger.name } }, as: :json
    end

    assert_response 201
  end

  test "should show ledger" do
    get ledger_url(@ledger), as: :json
    assert_response :success
  end

  test "should update ledger" do
    patch ledger_url(@ledger), params: { ledger: { description: @ledger.description, metadata: @ledger.metadata, name: @ledger.name } }, as: :json
    assert_response 200
  end

  test "should destroy ledger" do
    assert_difference('Ledger.count', -1) do
      delete ledger_url(@ledger), as: :json
    end

    assert_response 204
  end
end
