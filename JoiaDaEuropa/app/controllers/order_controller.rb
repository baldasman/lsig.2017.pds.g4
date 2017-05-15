class OrderController < ApplicationController

  def index
    @order = Order.all
  end

  def show
    @order = Order.find_by(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_show_path, flash[:notice] => "Your Order was save"
    else
      render :action => "new"
    end
  end

  def edit
    @order = Order.new
  end

end