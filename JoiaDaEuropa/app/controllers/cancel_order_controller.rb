class CancelOrderController < ApplicationController
  def index
    @order = Order.find_by(params[:id])
  end
end
