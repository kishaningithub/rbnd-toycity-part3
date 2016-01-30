class Customer
  attr_reader :name
  
  @@customers = []
  
  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end
  
  def self.all
    @@customers
  end
  
  def self.find_by_name(name)
    @@customers.select{|customer| customer.name == name}.first
  end
  
  def purchase(product)
    Transaction.new(self, product)
  end
  
  def return_product(product)
    transaction = Transaction.find_by_customer_for_product(self, product).last
    Transaction.cancel(transaction)
  end
  
  private
  
  def add_to_customers
    raise DuplicateCustomerError, "'#{@name}' already exists." unless !duplicate?
    @@customers << self
  end
  
  def duplicate?
    @@customers.map{|customer| customer.name}.include? @name
  end
  
end