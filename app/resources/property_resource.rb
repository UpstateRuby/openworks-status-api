class PropertyResource < JSONAPI::Resource
	attributes :name, :value, :unit, :precision

  has_one :thing
end
