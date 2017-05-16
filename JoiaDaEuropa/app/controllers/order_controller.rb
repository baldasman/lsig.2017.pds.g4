class OrderController < ApplicationController

    def index
        @order = Order.all
    end

    def show
        @order = Order.find(2)
    end

    def new
        @order = Order.new
    end

    def create

        @order = Order.new(client_id: current_user.client.id, state_id: 1)

        _order = params[:order]

        @order.state_id = 1 # default state: pendent
        @order.description = _order[:description]
        @order.unit_price = _order[:unit_price]
        @order.quantity = _order[:quantity]

        @order.delivery_date = Date.new(_order['delivery_date(1i)'].to_i, _order['delivery_date(2i)'].to_i, _order['delivery_date(3i)'].to_i)


        if @order.save
            redirect_to order_show_path, flash[:notice] => "Your Order was save"
        else
            render :action => "new"
        end

    end

    def edit
        @order = Order.new
    end

    private

    def order_params

        params[:order]

    end

end