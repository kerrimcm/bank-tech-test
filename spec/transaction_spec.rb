require 'transaction'

describe Transaction do
  let(:account) { double BankAccount.new }
  subject(:transaction) { described_class.new(account.deposit, account.withdraw, account.balance) }

  it 'stores the relevant info about each transaction' do
    allow(account).to receive(:deposit).and_return(150)
    allow(account).to receive(:withdraw).and_return(0)
    allow(account).to receive(:balance).and_return(150)
    expect(transaction.credit).to eq 150
    expect(transaction.debit).to eq 0
    expect(transaction.current_balance).to eq 150
    expect(transaction.date).to eq '01/06/2021'
  end
end
