class HoldOrderController < ApplicationController

  def index
    @order = Order.find_by*

    if @order.nil?
      puts "There is no orders"
    end
   end
end
