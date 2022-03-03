class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validate :date_cannot_be_in_the_past
  validate :start_must_be_before_end_time

  def date_cannot_be_in_the_past
    if check_in.present? && check_in < Date.today
      errors.add(:check_in, "can't be in the past")
    end

    if check_out.present? && check_out < Date.today
      errors.add(:check_out, "can't be in the past")
    end
  end

  def start_must_be_before_end_time
    errors.add(:check_in, "must be before end time") unless
          check_in < check_out
  end
end
