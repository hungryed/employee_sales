class QuotaSalesPerson < Employee
  attr_accessor :bonus, :quota

  def initialize(first_name, last_name, salary,commission_rate, bonus, quota)
    super(first_name, last_name, salary, commission_rate)
    @bonus = bonus
    @quota = quota
  end

  def met_quota?
    add_bonus if @amount_sold >= @quota
    @amount_sold >= @quota
  end

  def add_bonus
    @gross_salary += @bonus
  end

  def display
    super do
      "Beat Quota by #{@amount_sold - @quota}" if met_quota?
    end
  end
end
