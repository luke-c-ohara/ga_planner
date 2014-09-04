class UpdateBookingsTable < ActiveRecord::Migration
   def up
       change_column :bookings, :start_date, :date 
       change_column :bookings, :end_date, :date 
   end

   def down
       change_column :bookings, :start_date, :string 
       change_column :bookings, :end_date, :string
   end
 end
