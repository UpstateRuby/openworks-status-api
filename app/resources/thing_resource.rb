# class ThingResource < JSONAPI::Resource
# 	attributes :name, :status, :reason

#   relationship :location, to: :one

#   relationship :properties, to: :many

#   def initialize(model, context = nil)
#     super model, context
#     model.properties.each do |prop|
#       self.class.send(:define_method, prop.name.to_sym) do
#         prop.value
#       end
#       self.class.send(:attribute, prop.name.to_sym)
#     end
#   end
# end
