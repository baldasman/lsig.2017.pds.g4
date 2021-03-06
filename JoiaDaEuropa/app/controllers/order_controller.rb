require 'securerandom'

class OrderController < ApplicationController

    def all
        @order = Order.all
        #@order = Order.search(params[:search])
        #@order = Order.paginate :page => params[:page], :conditions => filter_conditions
    end

    def hold
        @orders = Order.where(state_id: 1)
    end

    def cancel
        @orders = Order.where(state_id: 3)
    end

    def end
        @orders = Order.where(state_id: 2)
    end

    def recent
        @orders = Order.where(state_id: 1).limit(10).order('id desc')
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


        # save uploaded file
        uploaded_io = params[:order][:upload]

        _filename = SecureRandom.hex + '_' + uploaded_io.original_filename
        @order.upload = Upload.new imageable_type: _filename

        File.open(Rails.root.join('public', 'uploads', _filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end

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
      @order = Order.find_by(id: params[:id])
      @states = State.all.map { |state| [state.description, state.id] }
      #@uploads = Upload.all
    end

    def update

        _order = params[:order]

        @order = Order.find_by(id: _order[:id])

        @order.description = _order[:description]
        @order.delivery_date = Date.new(_order['delivery_date(1i)'].to_i, _order['delivery_date(2i)'].to_i, _order['delivery_date(3i)'].to_i)
        @order.unit_price = _order[:unit_price]
        @order.quantity = _order[:quantity]
        @order.state_id = _order[:state_id]
        @order.upload_id = _order[:upload_id]

        if @order.save
            redirect_to order_detail_path(_order[:id])
            flash[:notice] = "YOU ORDER HAS BEEN SAVE"
        else
            redirect_to order_edit_path(_order[:id])
        end

    end

    private
    def order_params
        params[:order]

        #if params[:order].nil?
         # redirect_to order_new_path
         # flash[:notice] = "MAKE YOUR FIRST ORDER"
       # end
    end
end