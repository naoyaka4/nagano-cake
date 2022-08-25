class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
    @total_payment = 0
  end

  def create
      @cart_products = current_customer.cart_products.new(cart_product_params)
      @cart_products.save
      redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    current_customer.cart_products.destroy_all
    redirect_to cart_product_path
  end
  
  
    # def destroy_all
    #   Article.destroy_all
    #   redirect_to articles_path
    # end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id, :product_id, :amount, :created_at, :updated_at)
  end
end

