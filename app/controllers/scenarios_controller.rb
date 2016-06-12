class ScenariosController < ApplicationController
    
    before_action :set_scenario, only: [:edit, :update, :destroy, :show]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
      @scenarios = Scenario.all
    end
    
    def new
      @scenario = Scenario.new
    end
    
    def create
      @scenario = Scenario.new(scenario_params)
      @scenario.user = current_user
      if @scenario.save
         flash[:success] = 'Scenario was successfully created'
         redirect_to root_path
      else 
         render 'new'
      end
    end 
    
    def show
        @comments = @scenario.comments
    end 
   
    def edit
    end   
   
   def update
      if @scenario.update(scenario_params)
         flash[:success] = 'Scenario was successfully updated'
         redirect_to root_path
      else 
         render 'edit'
      end
   end 
   
   def destroy
      @scenario.destroy
      flash[:success] = 'Scenario was successfully deleted'
      redirect_to root_path
   end    
    
    private 
      def set_scenario
         @scenario = Scenario.find(params[:id])
      end
      def scenario_params
        params.require(:scenario).permit(:description, :user_id)
      end  
      def require_same_user
        if current_user != @scenario.user
            flash[:danger] = "You can only edit or delete your own scenarios"
            redirect_to root_path
        end
      end
end