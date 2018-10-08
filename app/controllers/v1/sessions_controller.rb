# class V1::SessionsController < ApplicationController

#   def create
#     user = User.where(email: params[:email]).first

#     if user && user.valid_password?(params[:password])
#       token = Tiddle.create_and_return_token(user, request)
#       # render json: user.as_json(only: [:id, :email]), status: :created
#       render json: {user: user, authentication_token: token}, status: :created
#     else
#       render json: {}, status: :unauthorized
#       # head(:unauthorized)
#     end
#   end

#   def destroy
#     Tiddle.expire_token(current_user, request) if current_user
#     render json: {}
#   end


# end