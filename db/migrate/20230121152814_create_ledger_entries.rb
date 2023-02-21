class CreateLedgerEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :ledger_entries, id: :uuid do |t|
      t.decimal :amount
      t.string :direction
      t.references :ledger_transaction, null: false, foreign_key: true, type: :uuid
      t.references :ledger_account, null: false, foreign_key: true, type: :uuid
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
