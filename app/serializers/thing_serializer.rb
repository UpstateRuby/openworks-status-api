class ThingSerializer < ActiveModel::Serializer
  attributes :name, :status, :reason

  belongs_to :location

  has_many :properties

  def initialize(model, context = nil)
    super model, context
    model.properties.each do |prop|
      self.class.send(:define_method, prop.name.to_sym) do
        prop.value
      end
      self.class.send(:attribute, prop.name.to_sym)
    end
  end
end
