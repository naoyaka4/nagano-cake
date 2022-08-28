class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
    @total_payment = 0
  end

  def create
    @cart_product = current_customer.cart_products.new(cart_product_params)
    @cart_products = current_customer.cart_products.all
    if CartProduct.find_by(product_id: @cart_product.product_id)
      @update_cart_product = CartProduct.find_by(product_id: @cart_product.product_id)
      # 追加の数量をカートに入っている数量に足す
      @cart_product.amount += @update_cart_product.amount
      @update_cart_product.destroy
    end

    if @cart_product.save
      redirect_to cart_products_path
    else
      redirect_to back
    end
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
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id, :product_id, :amount, :created_at, :updated_at)
  end
end

