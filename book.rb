class Book
  @@on_shelf = []
  @@on_loan = []
  @@bookid = 0

  attr_accessor :due_date

  def initialize(name, author, isbn)
    @name = name
    @author = author
    @isbn = isbn
    @id = @@bookid += 1
  end

  def self.create(name, author, isbn)
    new_book = new(name, author, isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end
end
