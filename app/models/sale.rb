class Sale
  attr_reader :name, :amount
  @@all_sales = []

  def initialize(name, amount)
    @name = name
    @amount = amount
    @@all_sales << @amount
  end

  def self.calculate_total_sales
    @@all_sales.inject(:+)
  end
end
