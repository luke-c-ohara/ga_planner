class Booking < ActiveRecord::Base

  attr_accessible :start_date, :end_date, :time, :classroom_id, :cohort_id

  belongs_to :classroom
  belongs_to :cohort

  validate :date_validation
  validate :uniqueness_of_date_range
  validate :not_past_date

  def date_validation
    errors.add :base, "End date cannot be before start date" if self[:end_date] < self[:start_date]
      #errors[:end_date] 
  end

  def uniqueness_of_date_range
    errors.add(:start_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date",
      start_date, start_date).count == 0
    errors.add(:end_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date",
      end_date, end_date).count == 0
  end
end

def not_past_date
  if self.start_date < Date.today
    errors.add(:start_date, 'not in past')
  elsif self.end_date < Date.today
    errors.add(:end_date, 'not in past')
  else  
    
  end
end

