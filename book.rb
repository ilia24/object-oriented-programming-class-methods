class Book
  @@on_shelf = []
  @@on_loan = []
  @@bookid = 0

  attr_accessor :due_date
  attr_reader :name, :author

  def initialize(name, author, isbn)
    @name = name
    @author = author
    @isbn = isbn
    @id = @@bookid += 1
  end

  def self.create(name, author, isbn)
    new_book = Book.new(name, author, isbn)
    @@on_shelf << new_book
    new_book
  end

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
      puts "- #{book.name} by #{book.author}"
    end
  end

  def self.browse
    @@on_shelf.sample
  end

  # def lent_out?
  #   if @@on_shelf.include?(self)
  #     puts "#{self[0]} is currently lent out"
  #   end
  # end
end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
jimstale = Book.create("The tales of Jim", "Jim", "2342423")
jimstale = Book.create("The tales of Jim", "Jim", "2342423")
