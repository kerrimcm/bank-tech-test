# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  attr_reader :balance, :transactions

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
    @transactions = []
  end

  def deposit(amount)
    raise 'You may not deposit negative amounts' unless amount.positive?
    add_money(amount)
    credit = credit_transaction(amount)
    @transactions << credit
  end

  def withdraw(amount)
    if @balance == 0 
      raise "Your balance is currently £#{@balance}.00"
    else 
      raise 'You may not withdraw negative amounts' unless amount.positive?
      deduct_money(amount)
      debit = debit_transaciton(amount)
      @transactions << debit
    end
  end

  private

  def credit_transaction(amount)
    @transaction.new(amount, 0, @balance)
  end

  def debit_transaciton(amount)
    @transaction.new(0, amount, @balance)
  end

  def add_money(amount)
    @balance += amount
  end

  def deduct_money(amount)
    @balance -= amount
  end
end
