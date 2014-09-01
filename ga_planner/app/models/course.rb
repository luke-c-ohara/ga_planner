class Course < ActiveRecord::Base
  attr_accessible :name, :duration, :course_type

  has_many :cohorts
  
end
