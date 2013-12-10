class Owner < Employee

  def company_quota_met?(total_sales)
    add_bonus if total_sales >= 250000
  end

  def add_bonus
    @gross_salary += 1000
  end

end
