class Admin::ProductsController < ApplicationController
   
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  # 不安箇所コメントアウト
  # def add_tax_sales_price
  # (self.sales_price * 1.10).round
  # end
  
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def create
      @product = Product.new(product_params)
    if @product.save
       redirect_to admin_products_path(@product.id)#notice: 'You have created book successfully.'?
    else
      render:new
    end
  end
  

 

  def update
    @product = Product.find(params[:id])
   
  end
 private

  def product_params
    params.require(:product).permit(:genre_id, :name, :explanation, :non_taced_price, :image, :is_active)
  end
end
