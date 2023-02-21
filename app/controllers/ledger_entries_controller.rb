class LedgerEntriesController < ApplicationController
  before_action :set_ledger_entry, only: [:show, :update, :destroy]

  # GET /ledger_entries
  def index
    @ledger_entries = LedgerEntry.all

    render json: @ledger_entries
  end

  # GET /ledger_entries/1
  def show
    render json: @ledger_entry
  end

  # POST /ledger_entries
  def create
    @ledger_entry = LedgerEntry.new(ledger_entry_params)

    if @ledger_entry.save
      render json: @ledger_entry, status: :created, location: @ledger_entry
    else
      render json: @ledger_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ledger_entries/1
  def update
    if @ledger_entry.update(ledger_entry_params)
      render json: @ledger_entry
    else
      render json: @ledger_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ledger_entries/1
  def destroy
    @ledger_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger_entry
      @ledger_entry = LedgerEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ledger_entry_params
      params.require(:ledger_entry).permit(:amount, :direction, :ledger_transaction_id, :ledger_account_id, :discarded_at)
    end
end
