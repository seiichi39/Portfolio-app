class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.string :court_name
      t.string :court_note

      t.timestamps
    end
  end
end
