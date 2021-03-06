# frozen_string_literal: true

class Printer
  def print(transactions)
    puts(print_header + print_body(transactions))
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_body(transactions)
    body = transactions.reverse.map do |transaction|
      "#{transaction.date} || #{formatter(transaction.credit)} || "\
      "#{formatter(transaction.debit)} || "\
      "#{formatter(transaction.current_balance)}\n"
    end
    body.join('')
  end

  def formatter(amount)
    amount.zero? ? '' : format('%<amount>.2f', amount: amount)
  end
end
