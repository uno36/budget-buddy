class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @category.transactions.sum(:amount)
  end

  def new
    @transaction = Transaction.new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new
    @transaction = @category.transactions.build
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    @transaction = @category.transactions.build(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category)
    else
      render 'new'
    end
  end
end
