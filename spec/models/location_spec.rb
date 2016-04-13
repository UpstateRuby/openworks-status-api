require 'rails_helper'

describe Location do
  it "has a valid factory" do
    expect(FactoryGirl.create(:location)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:location, name: nil)).to_not be_valid
  end

end
