class SalesController < ApplicationController
  def index
    @employees=Employee.get_employees(Rails.root.join("db/data/employee_info.csv"))
    @sales = Sale.import(Rails.root.join("db/data/sales_last_month.csv"))
  end
end
