class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.create_status == "in_production"
      @order.update(status: 2)
    elsif @order_detail.create_status == "production_completed"
      @order.update(status: 3)
    end
    redirect_to request.referer
  end
    
    
    
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:create_status)
  end
end


