class Admin::ProductsController < ApplicationController


def index
  @products = Product.all
end

def show
  @products = Product.all
  @product = Product.find(params[:id])
end

def new
  @product = Product.new
  @genre = Genre.all
end

def edit
  @product = Product.find(params[:id])
  @genre = Genre.all
end

def update
  @product = Product.find(params[:id])
  @genre = Genre.all
  if @product.update(product_params)
  redirect_to admin_products_path(@product.id)
  else
    render :edit
  end
end

def create
  @product = Product.new(product_params)
  if @product.save
     flash[:notice] = "新商品を登録しました"
     redirect_to admin_products_path(@product)
  else
    render :new
  end
end

private
  def product_params
    params.require(:product).permit(:name, :image, :introduction, :is_active, :price, :genre_id)
  end

end
