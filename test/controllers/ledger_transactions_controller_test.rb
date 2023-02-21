require "test_helper"

class LedgerTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ledger_transaction = ledger_transactions(:one)
  end

  test "should get index" do
    get ledger_transactions_url, as: :json
    assert_response :success
  end

  test "should create ledger_transaction" do
    assert_difference('LedgerTransaction.count') do
      post ledger_transactions_url, params: { ledger_transaction: { description: @ledger_transaction.description, effective_at: @ledger_transaction.effective_at, external_id: @ledger_transaction.external_id, ledger_id: @ledger_transaction.ledger_id, metadata: @ledger_transaction.metadata, posted_at: @ledger_transaction.posted_at, status: @ledger_transaction.status } }, as: :json
    end

    assert_response 201
  end

  test "should show ledger_transaction" do
    get ledger_transaction_url(@ledger_transaction), as: :json
    assert_response :success
  end

  test "should update ledger_transaction" do
    patch ledger_transaction_url(@ledger_transaction), params: { ledger_transaction: { description: @ledger_transaction.description, effective_at: @ledger_transaction.effective_at, external_id: @ledger_transaction.external_id, ledger_id: @ledger_transaction.ledger_id, metadata: @ledger_transaction.metadata, posted_at: @ledger_transaction.posted_at, status: @ledger_transaction.status } }, as: :json
    assert_response 200
  end

  test "should destroy ledger_transaction" do
    assert_difference('LedgerTransaction.count', -1) do
      delete ledger_transaction_url(@ledger_transaction), as: :json
    end

    assert_response 204
  end
end
