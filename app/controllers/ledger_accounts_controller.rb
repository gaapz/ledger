class LedgerAccountsController < ApplicationController
  before_action :set_ledger_account, only: [:show, :update, :destroy]

  # GET /ledger_accounts
  def index
    @ledger_accounts = LedgerAccount.all

    render json: @ledger_accounts
  end

  # GET /ledger_accounts/1
  def show
    render json: @ledger_account
  end

  # POST /ledger_accounts
  def create
    @ledger_account = LedgerAccount.new(ledger_account_params)

    if @ledger_account.save
      render json: @ledger_account, status: :created, location: @ledger_account
    else
      render json: @ledger_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ledger_accounts/1
  def update
    if @ledger_account.update(ledger_account_params)
      render json: @ledger_account
    else
      render json: @ledger_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ledger_accounts/1
  def destroy
    @ledger_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger_account
      @ledger_account = LedgerAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ledger_account_params
      params.require(:ledger_account).permit(:name, :description, :metadata, :normal_balance, :currency, :currency_exponent, :ledger_id)
    end
end
