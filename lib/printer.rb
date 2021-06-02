class Printer
  def print(transactions)
    @transactions = transactions
    puts(print_header + print_body)
  end 

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_body
    @transactions.map do |transaction| 
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.current_balance}\n"
    end
  end
end