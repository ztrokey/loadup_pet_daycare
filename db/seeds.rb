# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(10) do |i|
  animals = %w[Dog Cat]
  hours = (2..8).to_a
  date = Time.now
  Booking.create(first_name: "Alpha#{i}",
                 last_name: "Beta#{i}",
                 animal_name: "Charlie#{i}",
                 animal_type: animals.sample,
                 hours_requested: hours.sample,
                 date_of_service: date + i.days)
end
