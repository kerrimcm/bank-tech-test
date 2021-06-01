# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    raise 'You may not deposit negative amounts' unless amount.positive?
    add_money(amount)
    credit = credit_transaction(amount)
  end

  def withdraw(amount)
    raise 'You may not withdraw negative amounts' unless amount.positive?
    deduct_money(amount)
    debit = debit_transaciton(amount)
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
