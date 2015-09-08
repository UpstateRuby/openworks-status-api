require 'rails_helper'

describe Thing do

  it "has a valid factory" do
    expect(FactoryGirl.create(:thing)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:thing, name: nil)).to_not be_valid
  end

  it "is invalid without a status" do
    expect(FactoryGirl.build(:thing, status: nil)).to_not be_valid
  end

  it "may have a reason" do
    expect(FactoryGirl.build(:thing, reason: nil)).to be_valid
  end

end
