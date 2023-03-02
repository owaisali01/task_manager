class DocumentsController < ApplicationController
  before_action :set_task, only: %i[create]

  def create
    @document = @task.documents.new(document_params)
      if @document.save
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
    @task = Task.find(params[:document][:task_id])
  end

  def document_params
    params.require(:document).permit(:file, :task_id)
  end
end
