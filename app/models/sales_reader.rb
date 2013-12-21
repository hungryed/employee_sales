class SaleReader
  include Enumerable
  attr_accessor :sales

 def initialize(filename)
  @filename = filename
  @sales = []
  read_sales
 end

 def self.import(filename)
  CSV.foreach(filename, headers:true, header_converters: :symbol) do |row|
    @sales << bake_sale(row)
  end
 end

 def bake_sale(sale_attributes)
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
