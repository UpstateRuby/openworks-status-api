class LocationResource < JSONAPI::Resource
	attributes :name

  relationship :things, to: :many
end
