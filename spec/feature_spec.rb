require 'bank_account'

describe 'Bank account features' do
  before(:example) do
    @new_account = BankAccount.new
  end

  context '#deposit' do
    it 'allows the user to deposit money into their account' do
      @new_account.deposit(200)
      bank_statement =  "date || credit || debit || balance\n"\
                        "02/06/2021 || 200.00 ||  || 200.00\n"
      expect { @new_account.summary }.to output(bank_statement).to_stdout
    end
  end
end