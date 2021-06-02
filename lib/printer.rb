# frozen_string_literal: true

class Printer
  def print(transactions)
    @transactions = transactions
    puts(print_header + print_body)
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_body
    body = @transactions.reverse.map do |transaction|
      "#{transaction.date} || #{format(transaction.credit)} || "\
      "#{format(transaction.debit)} || #{format(transaction.current_balance)}\n"
    end
    body.join('')
  end

  def format(amount)
    amount == 0 ? '' : sprintf('%.2f', amount)
  end
end
