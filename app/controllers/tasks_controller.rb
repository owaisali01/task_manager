class TasksController < ApplicationController
  before_action :set_task_object, :only=> [:edit,:update,:destroy]

  def index
    @board = Board.find(params[:q][:board])
    @q = Task.ransack(params[:q])
      respond_to do |format|
      @board_sections = BoardSection.where(id: @q.result.pluck(:board_section_id))
      format.js # actually means: if the client ask for js -> return file.js
      end
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)  
    respond_to do |format|
    if 
      @task.save
      format.html {redirect_to request.referer}
      format.js
      else
      render :new
      end
    end
  end
  def edit: end  
  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end
  def delete
    @task.destroy
    redirect_to @task
  end
  
  private
   
    def task_params
      params.require(:task).permit(:id,:name,:description,:status,:due_date,:story_point,:board_id,:board_section_id)
    end
    def set_task_object
      @task = Task.find(params[:id])
    end
    
end
