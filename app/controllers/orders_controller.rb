class OrdersController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @orders = Order.all.order('created_at DESC') 
    end
end
