class EmployeeSerializer
  include FastJsonapi::ObjectSerializer
  attribute :name
  attribute :phone do |o|
    p1 = o.phone[0..2]
    p2 = o.phone[3..5]
    p3 = o.phone[6..-1]
    p1.concat("-").concat(p2).concat("-").concat(p3)
  end
  attribute :age
  attribute :role do |o|
    o.role.capitalize
  end
  attribute :current_assignment do |o|
    AssignmentEmployeeSerializer.new(o.current_assignment)
  end
  attribute :recent_shifts do |o|
    o.shifts.finished.map{|s| ShiftEmployeeSerializer.new(s)}
  end

end
