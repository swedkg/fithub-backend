# frozen_string_literal: true

class V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    user = warden.authenticate(auth_options)
    if user
      token = Tiddle.create_and_return_token(user, request, expires_in: 1.day)
      render json: {authentication_token: token, user: user}
    else
      head(:accepted)
    end
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

  # def update_info
  #   # @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     puts 'the user info successfully updated' #add whatever you want
  #   else
  #     puts 'failed'
  #   end
  # end

  private

  # this is invoked before destroy and we have to override it
  def verify_signed_out_user
  end

  def options
    headers["Access-Control-Allow-Origin"] = request.env["HTTP_ORIGIN"]
    headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
    headers["Access-Control-Max-Age"] = "1000"
    headers["Access-Control-Allow-Headers"] = "*,x-requested-with, X-Total-Count"
    headers["Access-Control-Expose-Headers"] = "X-Total-Count"
    head :ok
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
