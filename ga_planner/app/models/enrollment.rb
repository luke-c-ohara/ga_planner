class Enrollment < ActiveRecord::Base
  attr_accessible :pre_work, :start_date, :user_id, :fees, :cohort_id

  belongs_to :user
  belongs_to :cohort

end
