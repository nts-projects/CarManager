class CarsController < ApplicationController

	def index
		@cars = Car.all
	end

	def show
		#find car based on GET params
		@car = Car.find(params[:id])

		#select readings for car and order them by date
		@readings = @car.readings.order(:date)
		#@readings.order!(:odo)

		if @readings.empty?
			
			#readings is nil
			@max_odo = 0
			@min_odo = 0
			@car_dist = 0
			@fuel_used = 0
			@fuel_cost = 0

		else
			#readings is not nil

			@max_odo = @readings.maximum("odo")
			@min_odo = @readings.minimum("odo")
			@car_dist = @max_odo - @min_odo
			@fuel_used = @readings.sum("fuel_vol") 
			@fuel_cost = @readings.sum("fuel_cost")
		end


	end

	def edit
		@car = Car.find(params[:id])
	end

	def update

		@car = Car.find(params[:id])

		if @car.update_attributes(car_params)

			#redirect_to(:action => 'show', :id => @reading.id)
			redirect_to car_path
		else
			redirect_to root_path
		end

	end


	def new

		@car = Car.new()

	end

	def create

   		@car = Car.new(car_params)
    	if @car.save
    		#flash[:notice] = "The reading has been created."
    		redirect_to car_path(@car.id)
    	else
    		#flash[:notice] = "The reading did not save."
      		render 'new'
    	end

	end

  	def destroy
		#find the car using params id
   		@car = Car.find(params[:id])
   		#delete the car from the database
   		if @car.destroy

    		redirect_to root_path
    	else

      		redirect_to root_path
    	end

  	end


	private

	def car_params
		params.require(:car).permit(:make,:model,:model_year,:variant,:rego,:colour,:vin,:date_acquired,:image)
	end

end
