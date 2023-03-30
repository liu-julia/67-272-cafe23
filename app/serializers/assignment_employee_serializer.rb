class AssignmentEmployeeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :assignment
  attribute :store do |o| 
    o.store.name
  end
  attribute :pay_grade do |o|
    o.pay_grade.level
  end
  attribute :as_of do |o|
    o.start_date.strftime("%B %d, %Y")
  end
end
