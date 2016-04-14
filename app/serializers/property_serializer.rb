class PropertySerializer < ActiveModel::Serializer
  attributes :name, :value, :unit, :precision

  has_one :thing
end
