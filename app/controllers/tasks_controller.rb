class TasksController < ApplicationController
  before_action :set_task_object, :only=> [:edit,:update,:destroy]

  def index
    
  end
  def new
    @task = Task.new
  end
  

  def create
    @task = Task.new(task_params)
      
    if 
      @task.save
      redirect_to root_path
    else
      render :new
    end
    end

    def edit; end
    
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
