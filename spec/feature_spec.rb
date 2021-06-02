# frozen_string_literal: true

require 'bank_account'

describe 'Bank account features' do
  before(:example) do
    @new_account = BankAccount.new
    @current_date = Time.new.strftime('%d/%m/%Y')
  end

  context '#deposit' do
    it 'allows the user to deposit money into their account' do
      @new_account.deposit(200)
      bank_statement =  "date || credit || debit || balance\n"\
                        "#{@current_date} || 200.00 ||  || 200.00\n"
      expect { @new_account.summary }.to output(bank_statement).to_stdout
    end
  end

  context '#withdraw' do
    it 'allows the user to withdraw money from their account' do
      @new_account.deposit(1000)
      @new_account.withdraw(500)
      bank_statement = "date || credit || debit || balance\n"\
                       "#{@current_date} ||  || 500.00 || 500.00\n"\
                       "#{@current_date} || 1000.00 ||  || 1000.00\n"
      expect { @new_account.summary }.to output(bank_statement).to_stdout
    end
  end

  context '#summary' do
    it 'prints the past several transactions in reverse chronological order' do
      @new_account.deposit(1000)
      @new_account.withdraw(500)
      @new_account.deposit(2000)
      bank_statement = "date || credit || debit || balance\n"\
                       "#{@current_date} || 2000.00 ||  || 2500.00\n"\
                       "#{@current_date} ||  || 500.00 || 500.00\n"\
                       "#{@current_date} || 1000.00 ||  || 1000.00\n"
      expect { @new_account.summary }.to output(bank_statement).to_stdout
    end
  end
end
