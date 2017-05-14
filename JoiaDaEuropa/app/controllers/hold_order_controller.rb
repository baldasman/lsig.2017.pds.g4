class HoldOrderController < ApplicationController

  def index
    @order = Order.find(1)

    if id.nil?
      show_message "There is no orders"
    end

  end


end
