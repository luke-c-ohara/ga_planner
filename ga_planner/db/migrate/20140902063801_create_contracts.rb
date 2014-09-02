class CreateContracts < ActiveRecord::Migration
    def change
      create_table :contracts do |t|
      t.string  :duration
      t.string  :position 
      t.integer :payment
      t.integer :user_id
      t.integer :cohort_id

        t.timestamps
      end
    end
  end
