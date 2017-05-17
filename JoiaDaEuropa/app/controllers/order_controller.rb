class OrderController < ApplicationController

    #filter_attributes :status
    #before_action :check_order

    def show
        @order = Order.find_by(params[:id])
        #@order = current_order.order
        #@order = Order.paginate :page => params[:page], :conditions => filter_conditions
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

    def update
        @order = current_order.order.find(params[:id])
        @order.update!(order_params)
        redirect_to order_show_path
    end

    def destroy
        @current_order = session[:current_order] = nil
        redirect_to cancel_order_index_path
    end
    #end

    private

    def order_params

        params[:order]

    end
end