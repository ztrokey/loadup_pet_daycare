class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :animal_name
      t.string :animal_type
      t.integer :hours_requested
      t.date :date_of_service
      t.decimal :total_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
