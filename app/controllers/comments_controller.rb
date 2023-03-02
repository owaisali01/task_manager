class CommentsController < ApplicationController
  before_action :set_task, only: %i[new create]

  def create
    @comment = @task.comments.new(comment_params)
      if @comment.save
        respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
        end
      else
        render :new
      end
  end

  private

  def set_task
    @task = Task.find(params[:comment][:task_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :description, :task_id, :user_id)
  end

end
