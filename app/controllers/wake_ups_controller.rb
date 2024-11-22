# frozen_string_literal: true

class WakeUpsController < ApplicationController
  def create
    sleeps = current_user.sleeps.find_by(clock_out: nil)
    if sleeps.present?
      sleeps.update(clock_out: Time.now)
      render json: { message: "Clock out successfully" }
    else
      render json: { errors: "You haven't clocked in yet." }, status: :unprocessable_entity
    end
  end
end
