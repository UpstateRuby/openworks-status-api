class Property < ActiveRecord::Base
  validates :thing, presence: true
	validates :name,
            presence: true,
            length: { maximum: 30 },
            format: {
              with: /\A[[:alpha:][:digit:]]+(?:[_-][[:alpha:][:digit:]]+)*\z/,
              message: "must follow http://jsonapi.org/format/#document-member-names"
            },
            uniqueness: { scope: :thing, message: "Thing already has property" }
	validates :value, presence: true
	validates :unit, presence: true
	validates :precision, presence: true

  belongs_to :thing
end
