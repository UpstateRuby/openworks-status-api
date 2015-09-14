class Location < ActiveRecord::Base
	validates :name, uniqueness: true, presence: true

  has_many :things

end
