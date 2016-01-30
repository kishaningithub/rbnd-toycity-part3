class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end
  
  def self.find_by_title(title)
    @@products.select{|product| product.title == title}.first
  end
  
  def self.in_stock
    @@products.select{|product| product.in_stock?}
  end

  def in_stock?
    @stock > 0
  end
  
  private 

  def add_to_products
    raise DuplicateProductError, "'#{@title}' already exists." unless !duplicate?
    @@products << self
  end
  
  def duplicate? 
    @@products.map {|product| product.title}. include? @title
  end
end
