class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.topic_id = params[:topic_id]

  #binding.pry
  end
  
  def create
    comment = Comment.new(user_id: current_user.id,topic_id: params[:comment][:topic_id], comment: params[:comment][:comment])
    
  #binding.pry
    
    if comment.save!
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントが投稿できませんでした'
      
      render :new
    end
  end
  
  
end
