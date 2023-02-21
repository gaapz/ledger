class LedgerEntry < ApplicationRecord
  belongs_to :ledger_transaction
  belongs_to :ledger_account
end
