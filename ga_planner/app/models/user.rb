class User < ActiveRecord::Base
 attr_accessible :name, :role, :email, :password, :password_confirmation

 has_many :enrollments
 has_many :cohorts, through: :enrollments

 end

