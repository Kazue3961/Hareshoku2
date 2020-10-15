# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  before_action :reject_inactive_member, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

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

  def reject_inactive_member
    @member = Member.find_by(email: params[:member][:email])
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.is_active == false))
        flash[:error] = 'お客様は退会済みです。お手数ですが、別のメールアドレスで再度ご登録ください。'
        redirect_to new_member_session_path
      end
    else
      flash[:error] = "※メールアドレスとパスワードが一致しません。"
    end
  end

end