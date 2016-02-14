class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|

      t.belongs_to :car, index: true
    	#Table def for reading data model
    	t.date		:date
    	t.integer	:odo
    	t.float		:fuel_vol
    	t.float		:fuel_cost
      t.text		:note
      t.references :car
      t.timestamps null: false
    end
  end
end
