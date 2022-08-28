class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_detail][:order_id])
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.create_status == "in_production"
      @order.update(status: 2)
    end
    @is_all_production_completed = true
    @order.order_details.each do |order_detail|
      @is_all_production_completed = @is_all_production_completed && (order_detail.create_status == 'production_completed')
    end
    if @is_all_production_completed == true
      @order.update(status: 3)
    end
    redirect_to request.referer
  end




  private

  def order_detail_params
    params.require(:order_detail).permit(:create_status, :order_id)
  end
end


