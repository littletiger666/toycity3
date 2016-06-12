class Transaction
  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []

  def initialize (customer, product)
    unless product.in_stock?
      raise OutOfStockError, "#{product.title} is out of stock"
    else
      @customer = customer
      @product = product
      @id = @@id
      add_to_transaction
      @@id += 1
      product.stock -= 1
      if product.stock <= 3
        puts "Attention!! The inventory of '#{product.title}' is running low"
      end
    end
  end

  def self.total_sales
    @@transactions.inject(0) {|total, transaction| total+transaction.product.price}
  end

  def self.all
    @@transactions
  end

  def self.find num
    transaction = @@transactions.select {|transaction| transaction.id == num}
    transaction[0]
  end


  private

  def add_to_transaction
    @@transactions << self
  end


end
