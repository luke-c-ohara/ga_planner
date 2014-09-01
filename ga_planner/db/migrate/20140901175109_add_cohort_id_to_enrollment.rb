class AddCohortIdToEnrollment < ActiveRecord::Migration
 def change
   add_column :enrollments, :cohort_id, :integer
  end
end
