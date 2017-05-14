class HoldOrderController < ApplicationController

  def index
    @order = Order.find_by(params[:id])

    #where @order.state_id("Pendente")

    #if description.nil?      show_message "There is no orders"    end

  end


end
