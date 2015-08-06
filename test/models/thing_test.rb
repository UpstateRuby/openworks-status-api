require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  
  test "statuses have getters and setters" do
    Thing::STATUSES.keys.each do |key|
      thing = Thing.create(name: "test #{key}", status: Thing::STATUSES[Thing::STATUSES.keys.first], reason: "Test #{key} reason")
      thing.send("#{key}!")
      assert thing.send("#{key}?")
    end
  end

  test "things have a name" do
    thing = Thing.new(status: 0, reason: "test")
    thing.valid?
    assert thing.errors.keys.include?(:name)
  end

  test "things have a status" do
    thing = Thing.new(name: "name!", reason: "test")
    thing.valid?
    assert thing.errors.keys.include?(:status)
  end

end
