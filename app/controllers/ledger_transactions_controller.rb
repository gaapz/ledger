class LedgerTransactionsController < ApplicationController
  before_action :set_ledger_transaction, only: [:show, :update, :destroy]

  # GET /ledger_transactions
  def index
    @ledger_transactions = LedgerTransaction.all

    render json: @ledger_transactions
  end

  # GET /ledger_transactions/1
  def show
    render json: @ledger_transaction
  end

  # POST /ledger_transactions
  def create
    @ledger_transaction = LedgerTransaction.new(ledger_transaction_params)

    if @ledger_transaction.save
      render json: @ledger_transaction, status: :created, location: @ledger_transaction
    else
      render json: @ledger_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ledger_transactions/1
  def update
    if @ledger_transaction.update(ledger_transaction_params)
      render json: @ledger_transaction
    else
      render json: @ledger_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ledger_transactions/1
  def destroy
    @ledger_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger_transaction
      @ledger_transaction = LedgerTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ledger_transaction_params
      params.require(:ledger_transaction).permit(:description, :status, :external_id, :effective_at, :posted_at, :metadata, :ledger_id, :ledger_entries_attributes => [:amount, :direction, :ledger_account_id])
    end
end
