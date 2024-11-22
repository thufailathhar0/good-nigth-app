# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorized!

  def authorized!
    render json: { errors: "Please add user id" }, status: :unauthorized if current_user.nil?
  end

  private

  def current_user
    @current_user ||= User.find_by(id: id)
  end

  def id
    request.headers["Authorization"]&.delete_prefix("Bearer ")
  end
end
