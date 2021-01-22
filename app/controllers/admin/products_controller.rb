class Admin::ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update]
before_action :set_genres, only: [:new, :edit, :index, :create, :update]
before_action :authenticate_admin!




def index
@products = Product.all.page(params[:page]).per(10)
end

def show

end

def new
 @product = Product.new
end

def edit

end

def update
 if @product.update(product_params)
    flash[:success] = "商品内容をを変更しました"
    redirect_to admin_product_path(@product)
 else
  render :edit
 end
end

def create
 @product = Product.new(product_params)
  if @product.save
    flash[:notice] = "新商品を登録しました"
    redirect_to admin_product_path(@product)
  else
    render :new
  end
end
end
