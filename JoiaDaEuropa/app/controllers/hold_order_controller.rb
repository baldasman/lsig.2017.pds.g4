class HoldOrderController < ApplicationController

    def index
        #Order.all.each do |order|
        #Person.where(["state_id = :1", { 1: state_id }])


        @orders = Order.where(state_id: 1)

    end


    #Order.where(state_id: [1])
end

