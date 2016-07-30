class OrdersController < ApplicationController
    
    respond_to :html
    
    before_action :authenticate_user!
    load_and_authorize_resource
    
    before_action :find_order, only: [:show]
    
    def index
        @orders = Order.all.order('created_at DESC') 
    end
    
    def show
    end
    
    def destroy
        @order.destroy
        respond_with @order, location: -> { orders_path }
    end
    
    private
    
        def find_order
            @order = Order.find(params[:id])
        end
end
