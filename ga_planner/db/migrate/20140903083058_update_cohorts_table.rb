class UpdateCohortsTable < ActiveRecord::Migration
   def up
       change_column :cohorts, :start_date, :date 
 
   end

   def down
       change_column :cohorts, :start_date, :integer 
 
   end
 end


