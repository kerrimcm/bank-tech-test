# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:transactions) { [transaction_one, transaction_two] }
  let(:transaction_one) do
    double(:transaction_one, credit: 200, debit: 0,\
                             date: '02/06/2021', current_balance: 200)
  end
  let(:transaction_two) do
    double(:transaction_two, credit: 0, debit: 10,\
                             date: '02/06/2021', current_balance: 190)
  end

  it 'prints out the top part of the header for the statement' do
    expect(subject.print_header).to eq "date || credit || debit || balance\n"
  end

  it 'prints out the transaction array in the desired format' do
    statement = "date || credit || debit || balance\n"\
                "02/06/2021 ||  || 10.00 || 190.00\n"\
                "02/06/2021 || 200.00 ||  || 200.00\n"
    expect { subject.print(transactions) }.to output(statement).to_stdout
  end
end
