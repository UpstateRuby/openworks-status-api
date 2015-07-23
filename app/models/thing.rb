class Thing < ActiveRecord::Base
	validates :name, uniqueness: true
end
