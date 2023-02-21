class CreateLedgerTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :ledger_transactions, id: :uuid do |t|
      t.string :description
      t.string :status
      t.string :external_id
      t.datetime :effective_at
      t.datetime :posted_at
      t.json :metadata
      t.references :ledger, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
