class BankAccount
  @@interest_rate = 1.01
  @@accounts = Array.new

  attr_reader :balance


  def self.create
    @@accounts << BankAccount.new
    return @@accounts
  end

  def initialize
    random = "Account Number:#{rand(1000000)}"
    @name = random
    @balance = 0
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


end
