class BankAccount
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def deposit(amount)
    add_money(amount)
  end

  def withdraw(amount)
    deduct_money(amount)
  end

  def transaction_time
    Time.new.strftime('%d/%m/%Y')
  end

  private

  def add_money(amount)
    @balance += amount
  end
  
  def deduct_money(amount)
    @balance -= amount
  end
end 
