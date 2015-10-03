FactoryGirl.define do
  factory :property do
    thing { FactoryGirl.create(:thing) }
    name "temperature"
    value "730"
    unit "farenheight"
    precision 1
  end

end
