class NewOrderController < ApplicationController


  def new
    @order = Order.new

  end

def index

  @client = Client.find(*1)
  @order = Order.new

end

def edit_order

  @order = Order.new

end

def save_order

  @order = Order.new

    #Descrição
    @order.description = params[:order][:description]

    #Data_Entrega
    @order.delivery_date = params[:order][:delivery_date]

    #Preço_Unitario
    @order.unit_price = params[:order][:unit_price]

    #Quantidade
    @order.quantity = params[:order][:quantity]

    #Estado
    @order.state_id = params[:order][:state_id]


    if @order.save
      redirect_to new_order_index_path
    end

  end
end
