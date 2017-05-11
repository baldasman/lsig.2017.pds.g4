class ClientAreaController < ApplicationController

  before_action :check_client

  def index

    @client = current_user.client

  end

  def edit_client

    @client = current_user.client

  end


  def save_client

    @client = current_user.client

    #Nome
    @client.name = params[:client][:name]

    #Telefone
    @client.phone_number = params[:client][:phone_number]

    #Nib
    @client.nib = params[:client][:nib]

    #Morada
    @client.address = params[:client][:address]


    if @client.save
      redirect_to client_area_index_path
    else
      flash[:error] = @client.errors.messages

      redirect_to client_area_client_path
    end



  end

  private

  def check_client

    @client = Client.find_by(user_id: current_user.id)

    if @client.nil?
      current_user.client = Client.new name: current_user.email
      current_user.save
    end

  end

end
