class ThingResource < JSONAPI::Resource
	attributes :name, :status, :reason

  relationship :location, to: :one
end
