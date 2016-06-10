class CommentsController < ApplicationController
    
    before_action :set_comment, only: [:edit, :update, :destroy, :show]
    
    def index
      @comments = Comment.all
    end
    
    def new
      @comment = Comment.new
    end
    
    def create

      @comment = Comment.new(comment_params)
      if @comment.save
         flash[:success] = 'Comment was successfully created'
         redirect_to root_path
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
      redirect_to scenario_path(comment.scenario)
   end    
    
    private 
      def set_comment
         @comment = Comment.find(params[:id])
      end
      def comment_params
        params.require(:comment).permit(:text, :user_id, :scenario_id)
      end    
    
end