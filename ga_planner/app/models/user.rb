class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :role, :email, :password, :password_confirmation

  has_many :enrollments
  has_many :studyings, through: :enrollments, source: :cohort

  has_many :contracts
  has_many :teachings, through: :contracts, source: :cohort

  validates :email, presence: true, on: :create
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create

  before_create :default_role

  def role?(role_to_compare)
   self.role.to_s == role_to_compare.to_s
  end

  private
  def default_role
   self.role ||= :member
  end

end


  


