class User < ActiveRecord::Base
 attr_accessible :name, :role, :email, :password, :password_confirmation

 has_many :enrollments
 has_many :cohorts, through: :enrollments

 has_many :contracts
 has_many :teachings, through: :contracts, source: :cohort

 # has_many :contracts
 # has_many :cohorts, through: :contracts

 end

