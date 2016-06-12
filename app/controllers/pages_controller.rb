class PagesController < ApplicationController
    
    def home
        @scenarios = Scenario.order(created_at: :desc)
    end
    
end