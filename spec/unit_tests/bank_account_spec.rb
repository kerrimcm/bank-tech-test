# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:bank_account) do
    described_class.new(printed_statement, transaction_class)
  end
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }
  let(:printed_statement) { double(:printed_statement) }

  it 'allows the user to make a desposit' do
    subject.deposit(1)
    expect(subject.balance).to eq 1
  end

  it 'allows the user to top up this balance further' do
    subject.deposit(1)
    subject.deposit(10)
    expect(subject.balance).to eq 11
  end

  it 'allows the user to withdraw from their account' do
    subject.deposit(100)
    subject.withdraw(50)
    expect(subject.balance).to eq 50
  end

  it 'throws an error if I try to deposit a negative amount' do
    expect { subject.deposit(-300) }. to raise_error 'You may not deposit negative amounts'
  end

  it 'throws an error if I try to withdraw a negative amount' do
    subject.deposit(1000)
    expect { subject.withdraw(-300) }. to raise_error 'You may not withdraw negative amounts'
  end

  it 'throws an error if I try to withdraw when there is 0 in the account' do
    expect { subject.withdraw(300) }. to raise_error 'Your balance is currently £0.00'
  end

  it 'records the transactions of the customer' do
    bank_account.deposit(1000)
    expect(bank_account.transactions).to include transaction
  end

  it 'prints out a summary of transactions' do
    expect(printed_statement).to receive(:print)
    bank_account.summary
  end
end
