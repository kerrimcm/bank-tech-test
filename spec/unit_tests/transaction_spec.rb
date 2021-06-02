# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject(:transaction) do
    described_class.new(150, 0, 150)
  end

  it 'stores the relevant info about each transaction' do
    expect(transaction.credit).to eq 150
    expect(transaction.debit).to eq 0
    expect(transaction.current_balance).to eq 150
    expect(transaction.date).to eq Time.new.strftime('%d/%m/%Y')
  end
end
