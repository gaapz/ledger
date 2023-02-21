require "test_helper"

class LedgerAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ledger_account = ledger_accounts(:one)
  end

  test "should get index" do
    get ledger_accounts_url, as: :json
    assert_response :success
  end

  test "should create ledger_account" do
    assert_difference('LedgerAccount.count') do
      post ledger_accounts_url, params: { ledger_account: { currency: @ledger_account.currency, currency_exponent: @ledger_account.currency_exponent, description: @ledger_account.description, ledger_id: @ledger_account.ledger_id, metadata: @ledger_account.metadata, name: @ledger_account.name, normal_balance: @ledger_account.normal_balance } }, as: :json
    end

    assert_response 201
  end

  test "should show ledger_account" do
    get ledger_account_url(@ledger_account), as: :json
    assert_response :success
  end

  test "should update ledger_account" do
    patch ledger_account_url(@ledger_account), params: { ledger_account: { currency: @ledger_account.currency, currency_exponent: @ledger_account.currency_exponent, description: @ledger_account.description, ledger_id: @ledger_account.ledger_id, metadata: @ledger_account.metadata, name: @ledger_account.name, normal_balance: @ledger_account.normal_balance } }, as: :json
    assert_response 200
  end

  test "should destroy ledger_account" do
    assert_difference('LedgerAccount.count', -1) do
      delete ledger_account_url(@ledger_account), as: :json
    end

    assert_response 204
  end
end
