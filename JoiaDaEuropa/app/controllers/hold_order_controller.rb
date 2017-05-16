class HoldOrderController < ApplicationController

  def index
    @order = Order.where(order.state_id = "1")

    #where @order.state_id("Pendente")

    #if description.nil?      show_message "There is no orders"    end

  end


end
