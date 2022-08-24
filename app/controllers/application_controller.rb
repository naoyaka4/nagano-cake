class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if current_user
      # ユーザーとカートの紐付け
      current_cart = current_user.cart || current_user.create_cart!
    else
      # セッションとカートの紐付け
      current_cart = CartProduct.find_by(id: session[:cart_product_id]) || CartProduct.create
      session[:cart_product_id] ||= current_cart_product.id
    end
    current_cart
  end

  protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :address, :phone_number])
   end
end
