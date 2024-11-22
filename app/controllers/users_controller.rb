# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized!, only: :index
  def index
    users = User.all

    render json: users, each_serializer: UserSerializer
  end
end
