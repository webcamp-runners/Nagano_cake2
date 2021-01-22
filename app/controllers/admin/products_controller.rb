class Admin::ProductsController < ApplicationController
def index
  @product = Product.all
end

def show
  @product = Product.all
end

def new
  @product = Product.new
  @genre = Genre.all
end

def edit
  @product = Product.find(params[:id])
  
end

def update
  @product = Product.find(params[:id])
  @genre = Genre.all
  @product.update(product_params)
  redirect_to product_path(@product.id)
end

def create

  @product = Product.new(product_params)
  @product.save
  redirect_to admin_products_path
end

private
  def product_params
    params.require(:product).permit(:name, :image, :introduction, :is_active, :price, :genre_id)
  end

end
