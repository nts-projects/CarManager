class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|

    	#Table def for Car data model
    	t.string 	:make
    	t.string 	:model
      t.string  :model_year
    	t.string 	:variant
    	t.string 	:rego
      t.string  :colour
    	t.string	:vin
    	t.date	 	:date_acquired
    	t.string	:image
     	t.timestamps null: false
    end
  end
end
