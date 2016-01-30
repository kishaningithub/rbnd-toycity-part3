class Transaction
  attr_reader :id, :product, :customer
  
  @@transactions = []
  
  def initialize(customer, product)
    @customer = customer
    @product = product
    add_to_transactions
  end
  
  private
  
  def add_to_transactions
    product.stock = product.stock - 1
    @id = @@transactions.count + 1
    @@transactions << self
  end
end