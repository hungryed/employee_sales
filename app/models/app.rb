require 'csv'

require_relative 'employee'
require_relative 'employee_reader'
require_relative 'sale'
require_relative 'quota_sales_person'
require_relative 'owner'
require_relative 'commission_sales_person'
require_relative 'sales_reader'

employee_info_file = 'employee_info.csv'
sales_info = 'sales_last_month.csv'

employees = EmployeeReader.new(employee_info_file)
sales = SaleReader.new(sales_info)

sales.each do |sale|
  employee_name = employees.find {|employee| sale.name == employee.last_name}
  employee_name.amount_sold += sale.amount
end
total_sales = Sale.calculate_total_sales

employees = employees.each do |employee|
  employee_class = employee.class.to_s
  employee.commission_calculator
  employee.met_quota? if employee_class == "QuotaSalesPerson"
  employee.get_net_pay
  employee.company_quota_met?(total_sales) if employee_class == 'Owner'
  employee.display
end
