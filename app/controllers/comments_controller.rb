class CommentsController < ApplicationController
  before_action :set_comment_object :only=>[:show,:edit,:update,:delete]

  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new
  end
  def show
  end
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
  end
  def delete
    @comment.delete
      redirect_to @comment
  end
private
  def set_comment_object
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:id,:description,:task_id,:user_id)
  end
end
