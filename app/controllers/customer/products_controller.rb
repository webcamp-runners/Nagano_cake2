class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  @products = Product.all

  @product = Product.find(params[:id])
  end

  private
	def product_params
		parmas.require(:product).permit(:name, :image, :introduction, :is_active, :price, :genre)
	end
end
