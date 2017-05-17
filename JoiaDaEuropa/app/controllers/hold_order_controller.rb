class HoldOrderController < ApplicationController

  def index
    #Order.all.each do |order|
    #Person.where(["state_id = :1", { 1: state_id }])
    end
    @order = Order.where("state_id= 1 {params [:order]}")
    #Order.where(state_id: [1])
    end

