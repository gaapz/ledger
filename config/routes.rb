Rails.application.routes.draw do
  resources :ledger_entries
  resources :ledger_transactions
  resources :ledger_accounts
  resources :ledgers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
