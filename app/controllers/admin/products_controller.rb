class Admin::ProductsController < ApplicationController
def index

end

def show

end

def new
  @products = Product.new
end

def edit

end

def update

end

def create
  products = Product.new(product_params)
  products.save
  redirect_to products_path
end

private
  def product_params
    params.require(:products).permit(:name, :image,:introduction)
  end
  
end
