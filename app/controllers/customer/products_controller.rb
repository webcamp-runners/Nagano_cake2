class Customer::ProductsController < ApplicationController

  def index
    @product = Product.all
    @product = Product.new
  end

  def show

  end

  private
	def product_params
		parmas.require(:product).permit(:name, :image, :introduction, :is_active, :price, :genre)
	end
end
