# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

class BankAccount
  attr_reader :balance, :transactions

  DEFUALT_BALANCE = 0

  def initialize(printed_statement = Printer.new, transaction = Transaction)
    @balance = DEFUALT_BALANCE
    @transaction = transaction
    @transactions = []
    @printed_statement = printed_statement
  end

  def deposit(amount)
    raise 'You may not deposit negative amounts' unless amount.positive?

    add_money(amount)
    credit = credit_transaction(amount)
    store(credit)
  end

  def withdraw(amount)
    raise "Your balance is currently £#{@balance}.00" if @balance.zero?

    raise 'You may not withdraw negative amounts' unless amount.positive?

    deduct_money(amount)
    debit = debit_transaciton(amount)
    store(debit)
  end

  def summary
    @printed_statement.print(@transactions)
  end

  private

  def store(transaction)
    @transactions << transaction
  end

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
