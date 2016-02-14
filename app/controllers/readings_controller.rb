class ReadingsController < ApplicationController

  before_filter :find_car

  def edit
    @reading = @car.readings.find(params[:id])
  end

  def update
    @reading = @car.readings.find(params[:id])

    if @reading.update_attributes(reading_params)

      #redirect_to(:action => 'show', :id => @reading.id)
      redirect_to "/cars/"+@car.id.to_s
    end

  end

  def new
    @new_reading = @car.readings.new
  end
  
  def create
    @reading = @car.readings.new(reading_params)
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
    @reading = @car.readings.find(params[:id])
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

  def find_car
    @car = Car.find(params[:car_id])
  end

  def reading_params
    params.require(:reading).permit(:date, :odo, :fuel_vol, :fuel_cost, :car_id)
  end
end
