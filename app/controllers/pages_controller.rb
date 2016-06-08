class PagesController < ApplicationController
    
    def home
        @scenarios = Scenario.all
    end
    
end