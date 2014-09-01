class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :course_id

  belongs_to :course

  has_many :bookings
  has_many :classrooms, through: :bookings

  has_many :enrollments
  has_many :users, through: :enrollments
end
