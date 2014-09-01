class Booking < ActiveRecord::Base
attr_accessible :start_date, :end_date, :time, :classroom_id, :cohort_id

belongs_to :classroom
belongs_to :cohort

end
