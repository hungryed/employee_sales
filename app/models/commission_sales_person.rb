class CommissionSalesPerson < Employee
  attr_reader :commission

  def initialize(first_name, last_name, salary, commission_rate)
    super(first_name, last_name, salary, commission_rate)
  end

  def display
    super do
      puts "Commission: #{@total_commission}"
    end
  end
end
