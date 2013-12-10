class EmployeesController < ApplicationController
  def index
    @employees=Employee.get_employees(Rails.root.join("db/data/employee_info.csv"))
  end
end
