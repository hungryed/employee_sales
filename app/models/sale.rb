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

  def self.import(filename)
    sales = []
    CSV.foreach(filename, headers:true, header_converters: :symbol) do |row|
      sales << bake_sale(row)
    end
    sales
  end

  def self.bake_sale(sale_attributes)
    name = sale_attributes[:last_name]
    amount = sale_attributes[:gross_sale_value].to_i
    Sale.new(name, amount)
  end

  def each(&block)
    self.sales.each do |sale|
      block.call(sale)
    end
  end

end
