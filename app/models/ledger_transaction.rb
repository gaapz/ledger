class LedgerTransaction < ApplicationRecord
  belongs_to :ledger
  has_many :ledger_entries, dependent: :destroy

  accepts_nested_attributes_for :ledger_entries

  validates :effective_at, presence: true
  validate :ledger_entry_balanced

  def ledger_entry_balanced
    bal_check = {}
    ledger_entries.each do |le|
      if !bal_check.key?(le.ledger_account.currency)
        bal_check[le.ledger_account.currency] = {"credit": 0, "debit": 0}
      end
      if le.direction == "credit" 
        bal_check[le.ledger_account.currency][:credit] = bal_check[le.ledger_account.currency][:credit] + le.amount
      else
        bal_check[le.ledger_account.currency][:debit] = bal_check[le.ledger_account.currency][:debit] + le.amount
      end
    end
    
    bal_check.values.each do |bc|
      if bc[:credit] != bc[:debit]
        errors.add(:ledger_entries, "Balance should match with credit and debit entries with the similar currency")
      end
    end
  end
  
end
