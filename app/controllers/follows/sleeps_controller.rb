# frozen_string_literal: true

class Follows::SleepsController < ApplicationController
  def index
    start_date = 1.week.ago.beginning_of_day
    end_date = Time.current.end_of_day
    records =  Sleep.includes(:user)
                    .where(user: current_user.followed, clock_in: start_date..end_date)
                    .order(Arel.sql("(clock_out - clock_in) DESC"))
    render json: records, each_serializer: FollowedSleepSerializer
  end
end
