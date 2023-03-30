class EmployeeUpcomingSerializer
  include FastJsonapi::ObjectSerializer
  set_type :employee
  attribute :name
  attribute :role do |o|
    o.role.capitalize
  end
  attribute :pay_grade do |o|
    o.current_pay_grade
  end
  attribute :pay_rate do |o|
    o.current_pay_rate
  end
  attribute :over_18 do |o|
    o.over_18?
  end
end
