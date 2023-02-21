class CreateAccontLockVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :accont_lock_versions, id: :uuid do |t|
      t.integer :version
      t.references :ledger_account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
