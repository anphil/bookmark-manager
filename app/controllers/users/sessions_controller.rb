class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  before_action :check_user_confirmation, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def check_user_confirmation
    unless params[:user][:email].empty?
      user = User.find_by_email(params[:user][:email])
      if user && !user.confirmed?
        redirect_to new_confirmation_path(:user)
      end
    end
  end
end
