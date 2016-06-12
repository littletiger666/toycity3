class Product
  attr_reader :title, :price
  attr_accessor :stock

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
    @@products.find {|product| product.title == name}
  end

  def in_stock?
    @stock > 0
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
