class LedgerAccount < ApplicationRecord
  belongs_to :ledger
  has_many :ledger_entries, dependent: :destroy
  has_one :accont_lock_version, dependent: :destroy

  validates :name, :currency, :normal_balance, :ledger_id,  presence: true
  validate :currency_iso_check

  def currency_iso_check
    if !Money::Currency.find(currency).present?
      errors.add(:currency, "currency #{currency} not found")
    elsif currency_exponent.present? && Money::Currency.new(currency).exponent != currency_exponent
      errors.add(:currency, "#{currency} currency exponent is not mathcing - it should be #{Money::Currency.new(currency).exponent}")
    end
  end
end
