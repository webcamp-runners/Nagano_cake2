# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]
#before_action :configure_permitted_parameters , if: :devise_controller?
  def after_sign_in_path_for(resource)
    customer_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
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

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
     if @customer
        if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))

        redirect_to new_customer_session_path,notice: '退会しています'
        end
     else
      flash[:error] = "必須項目を入力してください。"
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password])
  end
end
