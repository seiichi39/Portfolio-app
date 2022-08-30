class AddBasicInfoToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :part1_time, :datetime
    add_column :reservations, :part2, :integer
    add_column :reservations, :part2_time, :datetime
    add_column :reservations, :part3, :integer
    add_column :reservations, :part3_time, :datetime
    add_column :reservations, :part4, :integer
    add_column :reservations, :part4_time, :datetime
    add_column :reservations, :part5, :integer
    add_column :reservations, :part5_time, :datetime            
  end
end