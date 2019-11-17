class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.topic_id = params[:topic_id]
    
    @topic = Topic.find(@comment.topic_id)
  #binding.pry
  end
  
  
  
end
