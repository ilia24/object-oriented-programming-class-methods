class Book
  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date



  def initialize(name, author, isbn)
    @name = name
    @author = author
    @isbn = isbn
  end

  def self.create(name, author, isbn)
    new_book = new(name, author, isbn)
  end
end
