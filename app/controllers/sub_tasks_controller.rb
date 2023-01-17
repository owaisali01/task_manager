class SubTasksController < ApplicationController
	before_action :set_subtask_object, :only=> [:edit,:update,:destroy]

  def index
    @subtasks = SubTask.all
  end
  def new
    @subtask = SubTask.new
  end
  def create
    @subtask = SubTask.new(subtask_params)
    if 
      @subtask.save
      redirect_to @subtask
    else
      render :new
    end
  end
  def edit; end
  def update
    if @subtask.update(subtask_params)
      redirect_to @subtask
    else
      render :edit
    end
  end
  def delete
    @subtask.destroy
    redirect_to @subtask
  end
  private
  def subtask_params
    params.require(:subtask).permit(:id,:name,:description,:status,:due_date,:task_id)
  end
  def set_subtask_object
    @subtask = SubTask.find(params[:id])
  end

end
