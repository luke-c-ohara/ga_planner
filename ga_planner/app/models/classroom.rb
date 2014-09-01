class Classroom < ActiveRecord::Base
attr_accessible :name, :location

has_many :bookings
has_many :cohorts, through: :bookings

end
