class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit

  end

  def update

  end

  def unsubscribe

  end

  def withdraw

  end

  private
  def update_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
