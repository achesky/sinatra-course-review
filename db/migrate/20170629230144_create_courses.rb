class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :professor
      t.integer :capacity
    end
  end
end
