class PagesController < ApplicationController
    
    #layout 'landing'
    
    def plans
        @basic_plan = PricingPlan.find_by_name('Basic')
    end
    
end
