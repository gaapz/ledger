class CreateLedgerAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :ledger_accounts, id: :uuid do |t|
      t.string :name
      t.string :description
      t.json :metadata
      t.string :normal_balance
      t.string :currency
      t.integer :currency_exponent
      t.references :ledger, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
