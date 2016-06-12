class Transaction
  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []

  def initialize (customer, product)
    @customer = customer
    @product = product
    @id = @@id
    add_to_transaction
    @@id += 1
    product.stock -= 1
    if product.stock <= 3
      puts "the inventory of '#{product.title}' is running low"
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
