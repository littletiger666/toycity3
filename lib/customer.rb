class Customer
  attr_reader :name

  @@customers = []

  def initialize options={}
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name name
    person = @@customers.select {|customer| customer.name == name}
    person[0]
  end

  def purchase product
    if product.stock == 0
      raise OutOfStockError, "#{product.title} is out of stock"
    else
      Transaction.new self, product
    end
  end

  private

  def add_to_customers
    c_name = @@customers.map {|person| person.name}
    unless c_name.include? self.name
      @@customers << self
    else
      raise DuplicateProductError, "#{self.name} already exists"
    end
  end
end
