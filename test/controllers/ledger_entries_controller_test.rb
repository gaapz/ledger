require "test_helper"

class LedgerEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ledger_entry = ledger_entries(:one)
  end

  test "should get index" do
    get ledger_entries_url, as: :json
    assert_response :success
  end

  test "should create ledger_entry" do
    assert_difference('LedgerEntry.count') do
      post ledger_entries_url, params: { ledger_entry: { amount: @ledger_entry.amount, direction: @ledger_entry.direction, discarded_at: @ledger_entry.discarded_at, ledger_account_id: @ledger_entry.ledger_account_id, ledger_transaction_id: @ledger_entry.ledger_transaction_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ledger_entry" do
    get ledger_entry_url(@ledger_entry), as: :json
    assert_response :success
  end

  test "should update ledger_entry" do
    patch ledger_entry_url(@ledger_entry), params: { ledger_entry: { amount: @ledger_entry.amount, direction: @ledger_entry.direction, discarded_at: @ledger_entry.discarded_at, ledger_account_id: @ledger_entry.ledger_account_id, ledger_transaction_id: @ledger_entry.ledger_transaction_id } }, as: :json
    assert_response 200
  end

  test "should destroy ledger_entry" do
    assert_difference('LedgerEntry.count', -1) do
      delete ledger_entry_url(@ledger_entry), as: :json
    end

    assert_response 204
  end
end
