class Ledger < ApplicationRecord
  has_many :ledger_accounts, dependent: :destroy
	has_many :ledger_transactions, dependent: :destroy

	validates :name, presence: true
end
