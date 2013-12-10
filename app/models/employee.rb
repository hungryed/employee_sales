class Employee
  attr_reader :first_name, :last_name, :salary, :monthly_salary
  attr_accessor :amount_sold , :total_commission, :gross_salary, :net_pay

  def initialize(first_name, last_name, salary, commission_rate)
    @first_name = first_name
    @last_name = last_name
    @salary = salary
    @monthly_salary = monthly_salary
    @commission_rate = commission_rate
    @amount_sold = 0
    @gross_salary = monthly_salary
    @net_pay = 0
  end

  def get_net_pay
    @net_pay = (@gross_salary * 0.7).round(2)
  end

  def monthly_salary
    (@salary / 12.0).round(2)
  end

  def commission_calculator
    @total_commission = @amount_sold * @commission_rate
    @gross_salary += @total_commission
  end

  def display
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: #{@gross_salary}"
    yield if block_given?
    puts "Net Salary: #{@net_pay}"
    puts "***************************"
    puts ""
  end

end
