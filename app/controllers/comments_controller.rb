class CommentsController < ApplicationController
  before_action :set_comment_object, only: %i[show edit update delete]

  def index
    @comments = Comment.all
  end

  def new
    @comment = @task.comments.build
  end

  def show; end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referer }
        format.js
      else
        render :new
      end
    end
  end

  private

  def set_comment_object
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :description, :task_id, :user_id)
  end
end
