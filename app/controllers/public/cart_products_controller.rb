class Public::CartProductsController < ApplicationController
  before_action :setup_cart_product_item!, only: %i[add_product update_product delete_product]

  # カート内アイテムの表示
  def my_cart
    @cart_products = current_cart_product.cart_product.includes([:product])
    @total = @cart_products.inject(0) { |sum, product| sum product.sum_of_price }
  end

  # アイテムの追加
  def add_product
    @cart_product ||= current_cart.cart_products.build(product_id: params[:product_id])
    @cart_product.quantity += params[:quantity].to_i
    if  @cart_product.save
      flash[:notice] = '商品が追加されました。'
      redirect_to my_cart_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to product_url(params[:product_id])
    end
  end

  # アイテムの更新
  def update_product
    if @cart_product.update(quantity: params[:quantity].to_i)
      flash[:notice] = 'カート内のギフトが更新されました'
    else
      flash[:alert] = 'カート内のギフトの更新に失敗しました'
    end
    redirect_to my_cart_path
  end

  # アイテムの削除
  def delete_item
    if @cart_product.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to my_cart_path
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end
