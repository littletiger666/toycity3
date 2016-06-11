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

  def self.find_by_title name
    item = @@products.select {|product| product.title == name}
    item[0]
  end

  def in_stock?
    if self.stock > 0
      return true
    else
      return false
    end
  end

  def self.in_stock
    @@products.select {|product| product.stock > 0}
  end



  private

  def add_to_products
    name = @@products.map {|product| product.title}
    unless name.include? self.title
      @@products << self
    else
      raise DuplicateProductError, "#{self.title} already exists"
    end
  end
end
