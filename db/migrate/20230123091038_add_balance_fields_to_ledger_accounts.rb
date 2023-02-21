class AddBalanceFieldsToLedgerAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accont_lock_versions, :posted_balance, :bigint, default: 0
    add_column :accont_lock_versions, :pending_balance, :bigint, default: 0
    add_column :accont_lock_versions, :available_balance, :bigint, default: 0
  end
end
