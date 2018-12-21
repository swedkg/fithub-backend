# class V1::UsersController < Devise::UsersController
class V1::UsersController < ApplicationController
  def create
    puts params
    @user = User.new(user_params)
    if @user.save
      head(:ok)
    else
      # puts @user.errors
      render json: @user.errors.messages, status: :created
      # head(:no_content)
    end
    # end
  end

  def update
    # result = update_resource(current_user, params)
    @user = current_user
    puts @user
  end

  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name)
  end

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
end
