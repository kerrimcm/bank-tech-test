require_relative 'transaction'

class BankAccount
  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    add_money(amount)
    credit = @transaction.new(amount, 0, @balance)
  end

  def withdraw(amount)
    deduct_money(amount)
    debit = @transaction.new(0, amount, @balance)
  end

  private

  def add_money(amount)
    @balance += amount
  end
  
  def deduct_money(amount)
    @balance -= amount
  end
end 
