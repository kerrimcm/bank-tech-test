require 'bank_account'

describe BankAccount do
  it 'allows the user to make a desposit' do
    subject.deposit(1)
    expect(subject.balance).to eq 1
  end
end 
