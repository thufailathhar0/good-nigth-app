# frozen_string_literal: true

class Sleep < ApplicationRecord
  belongs_to :user

  validate :ensure_no_nil_clock_out, on: :create

  def ensure_no_nil_clock_out
    errors.add(:base, "You still have records with nil clock_out.") if Sleep.exists?(user_id: user_id, clock_out: nil)
  end

  def duration
    return nil if clock_out.nil?

    duration = clock_out - clock_in

    hours = (duration / 3600).to_i
    minutes = ((duration % 3600) / 60).to_i
    "#{hours} hours and #{minutes} minutes"
  end
end
