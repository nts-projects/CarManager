# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#t1 = Tag.create(title: "Beaches", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg")
#Destination.create(name: "Ipanema", description: "The beach of Ipanema is known for its elegant development and its social life.", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg", tag_id: t1.id)

c1 = Car.create(make: 'Subaru', model: 'WRX', model_year: '2011', rego: '1DRV404', vin:'TBA', date_acquired: Date.new(2014,12,1), image: 'http://www.blogcdn.com/www.autoblog.com/media/2010/07/widebodywrx---03opt-1279517066.jpg', colour:'Silver')
Reading.create( date:Date.new(2014,12,1), odo: 39800, fuel_vol: 48.92, fuel_cost: 55.40, note: 'testing', car_id: c1.id)
Reading.create( date:Date.new(2015,01,13), odo: 40800, fuel_vol: 50.31, fuel_cost: 52.91, note: 'hello fuckers', car_id: c1.id)
Reading.create( date:Date.new(2015,02,22), odo: 41230, fuel_vol: 47.61, fuel_cost: 66.12, note: '', car_id: c1.id)
