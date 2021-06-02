# Bank Tech Test
A program which emulates the behaviour of a bank account where a user can make deposits, withdrawals and print out a summary of their transactions. 

## Getting started
- `git clone` this repo
- `cd` into the relevant directory 
- Run `irb` in your terminal to manually test the code, see example output below:

```
3.0.0 :001 > require './lib/bank_account.rb'
 => true 
3.0.0 :002 > new_account = BankAccount.new
 => #<BankAccount:0x00007ffebe91b030 @balance=0, @transaction=Transaction, @transactions=[], @printed_statement=#<Printer:0x00007ffebe91afe0>> 
3.0.0 :003 > new_account.deposit(100)
 => [#<Transaction:0x00007ffebe9622a0 @credit=100, @debit=0, @current_balance=100, @date="02/06/2021">] 
3.0.0 :004 > new_account.withdraw(50)
 => [#<Transaction:0x00007ffebe9622a0 @credit=100, @debit=0, @current_balance=100, @date="02/06/2021">, #<Transaction:0x00007ffebe08bd48 @credit=0, @debit=50, @current_balance=50, @date="02/06/2021">] 
3.0.0 :005 > new_account.deposit(25)
 => [#<Transaction:0x00007ffebe9622a0 @credit=100, @debit=0, @current_balance=100, @date="02/06/2021">, #<Transaction:0x00007ffebe08bd48 @credit=0, @debit=50, @current_balance=50, @date="02/06/2021">, #<Transaction:0x00007ffebe969550 @credit=25, @debit=0, @current_balance=75, @date="02/06/2021">] 
3.0.0 :006 > new_account.summary
date || credit || debit || balance
02/06/2021 || 25.00 ||  || 75.00
02/06/2021 ||  || 50.00 || 50.00
02/06/2021 || 100.00 ||  || 100.00
```

## My approach and code structure 
- From the outset I wanted to ensure a very clear distinction of duty between each class
- I started by breaking down the problem into a series of [user stories](#user-stories) and building out the `BankAccount` class
- As soon as I approached the problem of covering credit/debit transactions I started creating the `Transaction` class to handle this responsibility 
- The same for when I needed to handle the output of the bank statement with the `Printer` class
- The `BankAccount` class handles all the key interactions with the user including deposits, withdrawals and summaries

## Running tests, test coverage and linting
- Run `bundle install` to set up dependencies 
- Run `rspec` to see tests pass with test coverage 
- Run `rubocop` to see any issues detected with code quality

## Matching tech test requirements
- You are able to interact with this code via IRB 
- User can make deposits and withdraw
- Account statement (date, amount, balance) printing
- Data is kept in memory 

## User stories

```
As a customer
So I can put my money somewhere
I would like to open a bank account
```

```
As a customer
So that I can top up my account
I would like to be able to make a deposit
```

```
As a customer
So that I can take money out of my account
I would like to be able to make a withdrawal
```

```
As a customer 
So that I can keep better track of my finances
I would like to see the date of transaction for each deposit/withdrawal
```

``` 
As a customer
So that I know everything is running smoothly in my account
The details of each transaction are stored
```

```
As a customer
So my banking app catches my mistakes
I am not able to withdraw or deposit negative amounts
```

```
As a customer
So I am not overdrawn
I cannot withdraw on a balance of £0.00
```

``` 
As a customer 
So I can keep detailed financial records of my transactions
I can see a printed statement of my recent transactions
```
