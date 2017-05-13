class HoldOrderController < ApplicationController

  def index
    @client = Client.all
  end

end
