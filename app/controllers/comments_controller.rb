class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.topic_id = params[:topic_id]

  #binding.pry
  end
  
  def create
    comment = Comment.new(user_id: current_user.id,topic_id: comment_params[:topic_id], comment: comment_params[:comment])
    
  binding.pry
    
    if comment.save!
      redirect_to comment_params[:back_url], success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントを投稿できませんでした'
      
      render :new
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :comment, :back_url)
  end
  
end
