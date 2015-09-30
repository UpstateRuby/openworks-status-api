require 'rails_helper'

RSpec.describe Property, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:property)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:property, name: nil)).to_not be_valid
  end

  it "is invalid when a duplicate name belongs to the same thing" do
    thing = FactoryGirl.create(:thing)
    FactoryGirl.create(:property, thing: thing, name: "Duplicate")
    expect(FactoryGirl.build(:property, thing: thing, name: "Duplicate")).to_not be_valid
  end

  it "is valid when a duplicate name belongs to a different thing" do
    FactoryGirl.create(:property, name: "Duplicate")
    expect(FactoryGirl.build(:property, name: "Duplicate")).to be_valid
  end

  it "is invalid when name is too long" do
    expect(FactoryGirl.build(:property, name: "n"*31)).to_not be_valid
  end

  it "is valid when name is the minimum length" do
    expect(FactoryGirl.build(:property, name: "n")).to be_valid
  end

  it "is valid when name contains capital letters" do
    expect(FactoryGirl.build(:property, name: "Name")).to be_valid
  end

  it "is valid when name contains unicode characters" do
    expect(FactoryGirl.build(:property, name: "Ûnicöde")).to be_valid
  end

  it "is invalid when it begins with forbidden characters" do
    ["_", "-", " "].each do |c|
      expect(FactoryGirl.build(:property, name: "#{c}begins")).to_not be_valid
    end
  end

  it "is invalid when it ends with forbidden characters" do
    ["_", "-", " "].each do |c|
      expect(FactoryGirl.build(:property, name: "ends#{c}")).to_not be_valid
    end
  end

  it "is invalid when it contains invalid characters" do
    [
      "+", ",", ".", "[", "]", "!", '"', "#", "$", "%", "&" "'", "(", ")", "*" "/",
      ":", ";", "<", "=", ">", "?", "@", "\\", "^", "`", "{", "|", "}", "~"
    ].each do |c|
      expect(FactoryGirl.build(:property, name: "cont#{c}ains")).to_not be_valid
    end
  end

  it "is invalid without a value" do
    expect(FactoryGirl.build(:property, value: nil)).to_not be_valid
  end

  it "is invalid without a unit" do
    expect(FactoryGirl.build(:property, unit: nil)).to_not be_valid
  end

  it "is invalid without a precision" do
    expect(FactoryGirl.build(:property, precision: nil)).to_not be_valid
  end

end
