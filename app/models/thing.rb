class Thing < ActiveRecord::Base

	validates :name, uniqueness: {scope: :location_id}, presence: true
  validates :status, presence: true

  belongs_to :location

  has_many :properties

  STATUSES = {
    ok: 0,
    bad: 1,
    unknown: 2
  }

  STATUSES.keys.each do |key|

    define_method("#{key}!".to_sym) do
      update_attribute(:status, STATUSES[key])
    end

    define_method("#{key}?".to_sym) do
      status == STATUSES[key]
    end

  end

end
