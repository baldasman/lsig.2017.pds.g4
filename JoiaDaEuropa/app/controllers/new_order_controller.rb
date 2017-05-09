class NewOrderController < ApplicationController



  def index



  end

  def edit_order


  end

  def save_order



    #Descrição
    @order.description = params[:order][:description]

    #Data_Entrega
    @order.delivery_date = params[:order][:delivery_date]

    #Preço_Unitario
    @order.unit_price = params[:order][:unit_price]

    #Quantidade
    @order.quantity = params[:order][:quantity]


    if @order.save
      redirect_to new_order_index_path
    end

    private

  end


end
