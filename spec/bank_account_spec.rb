require 'bank_account'

describe BankAccount do
  it 'allows the user to make a desposit' do
    subject.deposit(1)
    expect(subject.balance).to eq 1
  end

  it 'allows the user to top up this balance further' do
    subject.deposit(1)
    subject.deposit(10)
    expect(subject.balance).to eq 11
  end
end 
