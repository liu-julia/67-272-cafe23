class StoreShiftSerializer
  include FastJsonapi::ObjectSerializer
  set_type :store
  attributes :name
end
