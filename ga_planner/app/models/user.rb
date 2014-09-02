class User < ActiveRecord::Base
 attr_accessible :name, :role, :email, :password_digest

 # :password, :password_confirmation

 has_many :enrollments
 has_many :studyings, through: :enrollments, source: :cohort

 has_many :contracts
 has_many :teachings, through: :contracts, source: :cohort

 # validates :email, presence: true
 # validates :email, uniqueness: { case_sensitive: false }
 # validates :password, presence: true, on: :create

 def role?(role_to_compare)
   self.role.to_s == role_to_compare.to_s
 end

 end

