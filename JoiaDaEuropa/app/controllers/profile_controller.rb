class ProfileController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    #@order = current_order

  end

end