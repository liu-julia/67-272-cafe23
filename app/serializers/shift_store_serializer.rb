class ShiftStoreSerializer
  include FastJsonapi::ObjectSerializer
  set_type :shift
  attribute :employee do |o|
    # o.employee.name
    EmployeeUpcomingSerializer.new(o.employee)
  end
  attribute :date
  attribute :start_time do |o|
    o.start_time.strftime("%k:%M")
  end
  attribute :end_time do |o|
    o.end_time.strftime("%k:%M")
  end
end
