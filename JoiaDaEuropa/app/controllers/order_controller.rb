class OrderController < ApplicationController

    #filter_attributes :status
    #before_action :check_order

    def show
        @order = Order.all
        #@order = Order.search(params[:search])
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
            redirect_to order_detail_path(@order.id), flash[:notice] => "Your Order was save"
        else
            render :action => "new"
        end
    end

    def detail
        @order = Order.find_by(id: params[:id])
    end

    def edit
        @order =Order.find_by(id: params[:id])
    end

    def update

        _order = params[:order]

        @order = Order.find_by(id: _order[:id])

        @order.description = _order[:description]
        @order.delivery_date = Date.new(_order['delivery_date(1i)'].to_i, _order['delivery_date(2i)'].to_i, _order['delivery_date(3i)'].to_i)
        @order.unit_price = _order[:unit_price]
        @order.quantity = _order[:quantity]

        if @order.save
            redirect_to order_show_path
        else
            redirect_to order_edit_path(_order[:id])
        end

    end

    private
    def order_params
        params[:order]
    end
end