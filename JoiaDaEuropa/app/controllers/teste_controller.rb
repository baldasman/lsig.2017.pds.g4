class TesteController < ApplicationController

  before_action :check_account

  def index

    @client = current_user.client

  end

  def edit_client

    @client = current_user.client

  end

  def save_client

    @client = current_user.client
    @client.name = params[:client][:name]

    if @client.save
      redirect_to client_area_index_path
    else
      flash[:error] = @client.errors.messages

      redirect_to client_area_edit_account_path
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
