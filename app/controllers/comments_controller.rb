class CommentsController < ApplicationController
    
    before_action :set_comment, only: [:edit, :update, :show, :destroy]
    
    before_action :require_user, except: [:index, :show]
    #before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
      @comments = Comment.all
    end
    
    def new
      @comment = Comment.new
    end
    
    def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      #@comment.scenario = Scenario.first
      if @comment.save
         flash[:success] = 'Comment was successfully created'
         redirect_to scenario_path(@comment.scenario)
      else 
         render 'new'
      end
    end 
    
    def show
    end 
   
    def edit
    end   
   
   def update
      if @comment.update(comment_params)
         flash[:success] = 'Scenario was successfully updated'
         redirect_to scenario_path(comment.scenario)
      else 
         render 'edit'
      end
   end 
   
   def destroy
      @comment.destroy
      flash[:success] = 'Comment was successfully deleted'
      redirect_to scenario_path(@comment.scenario)
   end    
    
    private 
      def set_comment
         @comment = Comment.find(params[:id])
      end
      def comment_params
        params.require(:comment).permit(:text, :user_id, :scenario_id)
      end   
      
      def require_same_user
        if current_user != @comment.user
            flash[:danger] = "You can only edit or delete your own comments"
            redirect_to root_path
        end
      end
end