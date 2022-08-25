class ApplicationController < ActionController::Base
  protect_from_forgery

  # helper_method :current_cart

  # def current_cart
  #   if current_user
  #     # ユーザーとカートの紐付け
  #     current_cart = current_user.cart || current_user.create_cart!
  #   else
  #     # セッションとカートの紐付け
  #     current_cart = CartProduct.find_by(id: session[:cart_product_id]) || CartProduct.create
  #     session[:cart_product_id] ||= current_cart_product.id
  #   end
  #   current_cart
  # end


end
