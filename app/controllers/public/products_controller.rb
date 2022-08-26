class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.page(params[:page])
    @products1 = Product.all
  end



  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new

    # @products = current_customer.products.new(product_params)
    # @products.save
    # redirect_to product_path(@cart_product.product_id)

  end
end
