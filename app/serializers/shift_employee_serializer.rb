class ShiftEmployeeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :shift
  attributes :date, :status
  attribute :start_time do |o|
    o.start_time.strftime("%k:%M")
  end
  attribute :end_time do |o|
    o.end_time.strftime("%k:%M")
  end
end
