class Contract < ActiveRecord::Base
  attr_accessible :duration, :position, :payment, :user_id, :cohort_id

  belongs_to :user
  belongs_to :cohort

  validate :user_not_enrolled_on_cohort

  # 'has_many :teachings, :through => :contracts, :source => <name>'. Is it one of :user or :cohort?
  def user_not_enrolled_on_cohort
    errors.add :base, "User is enrolled on that cohort" if cohort.students.include?(user)
  end

end