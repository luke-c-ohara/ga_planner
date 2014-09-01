class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
    t.string :start_date
    t.integer :fees
    t.string :pre_work

      t.timestamps
    end
  end
end
