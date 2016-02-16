class Reading < ActiveRecord::Base

	belongs_to :car
	validates :car, presence: true

end
