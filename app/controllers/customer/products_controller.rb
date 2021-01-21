class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show

  end
  
  private
	def product_params
		parmas.require(:product).permit(:name, :image, :introduction)
	end
end
