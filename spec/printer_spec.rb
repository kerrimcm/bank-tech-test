require 'printer'

describe Printer do 
  let(:account) { double BankAccount.new }

  it 'prints out the top part of the header for the statement' do
    expect(subject.print_header).to eq "date || credit || debit || balance\n"
  end

  it 'prints out a transaction underneath the header' do
    allow(account).to receive(:deposit).and_return 1500
    expect(subject.print_body).to eq "01/06/2021 || 1500.00 || || 1500.00\n"
  end
end