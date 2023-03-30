class StoreUpcomingSerializer
  include FastJsonapi::ObjectSerializer
  set_type :shift_upcoming
  attribute :store do |o|
    o.store.name
  end
  attribute :shifts do |o|
    ShiftStoreSerializer.new(o)
  end
end
