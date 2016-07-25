class RegistrationsController < Devise::RegistrationsController
   
    def create
        params[:user][:email] = params[:stripeEmail]
        params[:user][:stripeToken] = params[:stripeToken]
        super
    end
    
end