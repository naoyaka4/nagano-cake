class Public::OrdersController < ApplicationController



  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])


  end

  def check

    @order = Order.new
    @customer = current_customer
    @payment_method = params[:order][:payment_method]

    if params[:order][:a] == '0'
     # byebug
      @order.post_code = @customer.post_code
       @order.address = @customer.address
       @order.name = @customer.first_name + @customer.last_name
    elsif params[:order][:a] == '1'
          @address = Address.find(params[:order][:address_id])
          @order.post_code = @address.post_code
          @order.address = @address.address
          @order.name = @address.name
          # @order.save

    elsif params[:order][:a] == '2' #条件を書かない場合はelse
          @order.post_code = params[:order][:post_code]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
    end
    # @address = Address.find(params[:order_id][:address_id])？
    @order.cost = 800
    @total_payment = 0
    @cart_products = current_customer.cart_products

    #こっち？ @cart_products = CartProduct.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_products = current_customer.cart_products.all
     @cart_products.each do |cart_product|
        @order_details = OrderDetail.new
        @order_details.order_id = @order.id
        @order_details.product_id = cart_product.product.id
        @order_details.purchase_price = cart_product.product.non_taced_price*1.1
        @order_details.amount = cart_product.amount
        @order_details.create_status = 0
        @order_details.save
      end
     current_customer.cart_products.destroy_all
     redirect_to orders_complete_path
  end



  # def create
  # @order = current_user.orders.new(order_params)
  # @order.save
  # @cart_items = current_user.cart_items.all
  #   @cart_items.each do |cart_item|
  #       @order_items = @order.order_items.new
  #       @order_items.item_id = cart_item.item.id
  #       @order_items.name = cart_item.item.name
  #       @order_items.price = cart_item.item.price
  #       @order_items.quantity = cart_item.quantity
  #       @order_items.save
# current_user.cart_items.destroy_all
  #   end









  def complete
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :cost, :status, :payment_method, :name, :post_code, :address, :total_payment)
  end
end