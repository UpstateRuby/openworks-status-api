class LocationSerializer < ActiveModel::Serializer
  attributes :name

  has_many :things
end
