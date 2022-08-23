class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
    @address1 = current_customer
    
  end

  def index
  end

  def show
  end

  def check
  end

  def complete
  end
end
