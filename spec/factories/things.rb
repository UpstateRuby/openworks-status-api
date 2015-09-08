FactoryGirl.define do
  factory :thing do |thing|
    thing.name "HVAC"
    thing.status 500
    thing.reason "Hot"
  end
end
