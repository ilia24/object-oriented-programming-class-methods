class BankAccount
  @@interest_rate = 1.01
  @@accounts = []

  attr_accessor :balance


  def self.create
    a = BankAccount.new
    @@accounts.push(a)
    return a
  end

  def self.accounts
    return @@accounts
  end

  def initialize
    @balance = 0.0
  end

  def deposit(numb)
    if numb.is_a? Numeric #back to the roots homie
      @balance += numb
      "Deposited #{numb}, your current balance is $#{@balance}"
    else
      "Thats not a valid number"
    end
  end

  def withdraw(numb)
    if (numb.is_a? Numeric) && (numb <= @balance)
      @balance -= numb
      "Withdrew #{numb}, your current balance is $#{@balance}"
    else
      "You dont have enough in your account to do this!"
    end
  end

  def self.total_funds
    total = 0
    @@accounts.each { |acc| total += acc.balance }
    return total
  end

  def self.interest_time
    @@accounts.each do |mult|
      mult.balance = (mult.balance) * @@interest_rate
    end
  end

end
