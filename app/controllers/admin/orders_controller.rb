class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order_detail.update(order_params)
    redirect_to request.referer
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
