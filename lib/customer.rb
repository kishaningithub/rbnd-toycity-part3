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
  
  private
  
  def add_to_customers
    raise DuplicateCustomerError, "'#{@name}' already exists." unless !duplicate?
    @@customers << self
  end
  
  def duplicate?
    @@customers.map{|customer| customer.name}.include? @name
  end
  
end