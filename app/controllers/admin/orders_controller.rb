class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confilmation"
      @order.order_details.update_all(create_status: 1)
    end
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end
end
