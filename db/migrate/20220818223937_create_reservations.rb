class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_date
      t.integer :part1

      t.timestamps
    end
  end
end
