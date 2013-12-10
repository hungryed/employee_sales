class EmployeeReader
  include Enumerable
  attr_reader :employees

  def initialize(filename)
    @filename = filename
    @employees = []
    read_file
  end

  def read_file
    CSV.foreach(@filename, headers:true, header_converters: :symbol) do |row|
      @employees << make_employee(row)
    end
  end

  def make_employee(attributes)
    job = attributes[:job]
    first_name = attributes[:first_name]
    last_name = attributes[:last_name]
    salary = attributes[:base_salary].to_i
    commission_rate = attributes[:commission].to_f
    bonus = attributes[:bonus].to_i
    quota = attributes[:quota].to_i
    if job == 'Commission'
      CommissionSalesPerson.new(first_name,last_name,salary,commission_rate)
    elsif job == 'Quota'
      QuotaSalesPerson.new(first_name,last_name,salary,commission_rate, bonus, quota)
    elsif job == 'Owner'
      Owner.new(first_name,last_name,salary,commission_rate)
    else
      Employee.new(first_name,last_name,salary,commission_rate)
    end
  end

  def each(&block)
    self.employees.each do |sale|
      block.call(sale)
    end
  end
end
