class EmployeeShiftSerializer
  include FastJsonapi::ObjectSerializer
  set_type :employee
  attribute :name
  attribute :role do |object|
    object.role.capitalize
  end
  attribute :pay_grade do |object|
    object.current_pay_grade
  end
  attribute :pay_rate do |object|
    object.current_pay_rate
  end
  attribute :over_18 do |object|
    object.over_18?
  end
end
