class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if  @customer.update(update_params)
    redirect_to my_page_customers_path(@customer.id), notice: 'お客様情報を更新しました。'
  else
    render :edit
  end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw

    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to "/"
  end

  private
  def update_params

    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
