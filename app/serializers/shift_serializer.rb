class ShiftSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :id, :type

  attribute :store do |object|
    StoreShiftSerializer.new(object.store)
  end
  attribute :employee do |object|
    EmployeeShiftSerializer.new(object.employee)
  end
  attributes :date
  attribute :start_time do |object|
    object.start_time.strftime("%k:%M")
  end
  attribute :end_time do |object|
    object.end_time.strftime("%k:%M")
  end
    
  attribute :duration
  attribute :report_completed do |object|
    object.report_completed?
  end
  attribute :jobs_worked do |object|
    object.jobs.map {|j| j.name}
  end
end
