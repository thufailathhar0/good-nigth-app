# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = current_user.followed_users.new(followed_id: params[:user_id])
    if follow.save
      render json: follow, serializer: FollowSerializer
    else
      render json: { errors: follow.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    followed_user.destroy

    render json: { message: "Unfollowed" }
  end

  private

  def followed_user
    followed_user = current_user.followed_users.find_by(followed_id: params[:id])

    render json: { errors: "User not found" }, status: :not_found if followed_user.nil?

    followed_user
  end
end
