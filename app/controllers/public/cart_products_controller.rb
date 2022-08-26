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
      @cart_product = CartProduct.find(params[:id])
# #  岡ちゃん作成     if @cart_products = find_by(product_id: cart_product_params[:product_id])
# #         @cart_products.amount += cart_product_params[:amount].to_i
# #         @cart_products.save
        
# #         end
  
# #   def create
# #   1. 追加した商品がカート内に存在するかの判別
# #     存在した場合
# #       2. カート内の個数をフォームから送られた個数分追加する
# #     存在しなかった場合
# #       カートモデルにレコードを新規作成する
# # end
  # 見本をもとに作成
#   @cart_product.current_customer_id = current_customer.id
#   if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
#     cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]) cart_product.number += params[:cart_product][:product_id].to_i cart_product.save
#     current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).save
#     redirect_to cart_products_path
#   elsif @cart_product.save
#     redirect_to cart_items_path
#   else
#     render 'products/show'
#   end
# end

    
    # 見本
  # def create
		# @cart_item = CartItem.new(cart_item_params)
		# @cart_item.end_user_id = current_end_user.id
		# if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
		# 	current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).number += params[:cart_item][:number].to_i
		# 	current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).save
		# 	flash[:notice] = "Item was successfully added to cart."
		# 	redirect_to cart_items_path


		# elsif @cart_item.save
		# 	flash[:notice] = "New Item was successfully added to cart."
		# 	redirect_to cart_items_path
		# else

		# 	render 'end_users/items/show'
		# end
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
  
  
    # def destroy_all
    #   Article.destroy_all
    #   redirect_to articles_path
    # end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id, :product_id, :amount, :created_at, :updated_at)
  end
end

