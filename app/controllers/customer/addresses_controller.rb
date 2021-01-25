class Customer::AddressesController < ApplicationController
 def index
  @address = Address.new
  @addresses = Address.all
 end

 def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  @address.save
  redirect_to request.referer, notice: '配送先を追加しました'
 end

 def destroy
  @address = Address.find(params[:id])
  @address.destroy
  redirect_to request.referer, notice: '配送先を消去しました'
 end

 def edit
  @address = Address.find(params[:id])
 end

 def update
  @address = Address.find(params[:id])
  if @address.update(address_params)
   redirect_to addresses_path, notice: '配送先情報を更新しました'
  else
   render "edit"
  end
 end

 private
 def address_params
  params.require(:address).permit(:address, :post_code, :name, :customer)
 end
end
