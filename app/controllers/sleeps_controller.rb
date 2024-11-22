# frozen_string_literal: true

class SleepsController < ApplicationController
  def index
    sleeps = current_user.sleeps.order(created_at: :desc)

    render json: sleeps, each_serializer: SleepSerializer
  end

  def create
    sleep = current_user.sleeps.new(clock_in: Time.now)
    if sleep.save
      render json: { message: "Clock in successfully" }
    else
      render json: { errors: sleep.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
