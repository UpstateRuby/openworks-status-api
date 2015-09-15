FactoryGirl.define do
  factory :thing do |thing|
    thing.name "HVAC"
    thing.status 500
    thing.reason "Hot"
    thing.location_id 1
  end
end
