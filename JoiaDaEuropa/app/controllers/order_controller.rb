class OrderController < ApplicationController

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end


  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order_index_path])

    if @order.save
      redirect_to order_index_path, :notice => "Your Order was save"
    else
      render "new"
    end
  end

end
