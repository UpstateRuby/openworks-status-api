FactoryGirl.define do
  factory :thing do
    sequence(:name) { |n| "thing#{n}" }
    status 500
    reason "Hot"
    location_id 1
  end
end
