class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :duration
      t.string :course_type 
      
      t.timestamps
    end
  end
end
