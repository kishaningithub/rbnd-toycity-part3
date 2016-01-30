class Transaction
  attr_reader :id, :product, :customer
  
  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    add_to_transactions
  end
  
  def self.all
    @@transactions
  end
  
  def self.find(id)
    @@transactions[id - 1]
  end
  
  private
  
  def add_to_transactions
    raise OutOfStockError, "'#{@product.title}' is out of stock." unless @product.in_stock?
    product.stock = product.stock - 1
    @id = @@transactions.count + 1
    @@transactions << self
  end
end