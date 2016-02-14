class ReadingsController < ApplicationController

	def edit

		@car = Car.find(params[:car_id])
		@reading = Reading.find(params[:id])

	end

	def update

		@car = Car.find(params[:car_id])
		@reading = Reading.find(params[:id])

		if @reading.update_attributes(reading_params)

			#redirect_to(:action => 'show', :id => @reading.id)
			redirect_to "/cars/"+@car.id.to_s
		end

	end

	def new
		@car = Car.find(params[:car_id])
    	@new_reading = Reading.new
    	@new_reading.car_id = @car.id
  	end
  
  	def create
  		#@car = Car.find(params[:car_id])
   		@reading = Reading.new(reading_params)
   		@reading.car_id = params[:car_id]
    	if @reading.save
    		#flash[:notice] = "The reading has been created."
    		redirect_to '/cars/'+@reading.car_id.to_s
    	else
    		#flash[:notice] = "The reading did not save."
      		render 'new'
    	end
  	end

  	def destroy
		#find the reading using params id
   		@reading = Reading.find(params[:id])
   		#delete the reading from the database
   		if @reading.destroy
    		#flash[:notice] = "The reading has been created."
    		redirect_to '/cars/'+ params[:car_id].to_s
    	else
    		#flash[:notice] = "The reading did not save."
      		redirect_to root_path
    	end

  	end


	private

	def reading_params

		params.require(:reading).permit(:date, :odo, :fuel_vol, :fuel_cost, :car_id)

	end
end
