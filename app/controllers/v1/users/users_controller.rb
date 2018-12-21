class V1::UsersController < ApplicationController
  def create
    puts params
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
