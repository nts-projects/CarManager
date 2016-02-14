class Car < ActiveRecord::Base

	has_many :readings, dependent: :destroy

	# 
	# min odo
	# max odo
	# distance_travelled
	# fuel used
	# fuel cost

	#attr_accessor :min_odo
	#attr_accessor :max_odo
	#attr_accessor :dist_travelled
	#attr_accessor :fuel_used


end
