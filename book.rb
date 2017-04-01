class Book
  @@on_shelf = []
  @@on_loan = []
  @@bookid = 0

  attr_accessor :due_date, :due
  attr_reader :name, :author

# This is responsible for creating the instance
  def initialize(name, author, isbn, due = nil)
    @name = name
    @author = author
    @isbn = isbn
    @id = @@bookid += 1
    @due = due
  end

  def self.create(name, author, isbn, due = nil)
    new_book = Book.new(name, author, isbn, due = nil)
    @@on_shelf << new_book
    new_book
  end
#This allows the user to perform various class level checks
  def self.available
    total_books = 0
    puts "Current books available for borrowing:"
    @@on_shelf.each do |book|
      total_books += 1
      puts "- #{book.name} by #{book.author}"
    end
    puts "There are a total of #{total_books} books available"
  end

  def self.borrowed
    @@on_loan.each do |book|
      return "- #{book.name} by #{book.author}"
    end
  end

  def self.current_due_date
    duetime = Time.now + 604800
    "The current due date for books taken out today is #{duetime.strftime("%A, %B %d at%l:%M %p")}" #7 days
  end

  def self.browse
    randombook = @@on_shelf.sample
    puts "You have pulled out: #{randombook.name} by #{randombook.author}"
  end

# This performs a quick class check to see if the book is currently lent
  def lent_out?
    if @@on_loan.include?(self)
      "#{self.name} is currently lent out"
    else
      "#{self.name} is not currently lent out!"
    end
  end

  def borrow
    if @@on_loan.include?(self)
      "Sorry this book is already lent out!"
    else
      self.due = Time.now + 604800
      @@on_loan << self
      "#{self.name} is now yours until next week, enjoy!"
    end
  end
end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
jimstale = Book.create("The tales of Jim", "Jim", "2342423")
jimstale = Book.create("The tales of Jim", "Jim", "2342423")
