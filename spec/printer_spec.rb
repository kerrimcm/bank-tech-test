require 'printer'

describe Printer do 
  it 'prints out the top part of the header for the statement' do
    expect(subject.print_header).to eq "date || credit || debit || balance\n"
  end
end