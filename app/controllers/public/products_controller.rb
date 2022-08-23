class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = current.customer
  end
end
