class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
  end

  def index
  end

  def show
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:a] == '0'
       @order.post_code = current_customer.post_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:a] == '1'
          @address = Address.find(params[:order][:address_id])
    elsif params[:order][:a] == '2'
          @order.post_code = @address.post_code
          @order.address = @address.address
          @order.name = current_customer.first_name + current_customer.last_name
      
    end
    # @address = Address.find(params[:order_id][:address_id])？
    @order.cost = 800
    @total_payment = 0
    @cart_products = CartProduct.all
    
    #こっち？ @cart_products = CartProduct.all

  
  end
  
  
  
  
  
  
  
  
  
  
  

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :cost, :status, :payment_method, 
    :name, :post_code, :address, :total_payment, :created_at, :updated_at)
  end
end