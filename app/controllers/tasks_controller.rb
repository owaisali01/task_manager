class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_board_section, only: %i[new create]

  def index
    @board = Board.find(params[:q][:board])
    @q = Task.ransack(params[:q])
    @tasks = @q.result
    respond_to do |format|
      @board_sections = BoardSection.where(id: @tasks.pluck(:board_section_id))
      format.js
    end
  end

  def new
    @task = @boardsection.tasks.new
  end

  def show
    @documents = Document.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @task = @boardsection.tasks.new(task_params)
      if @task.save
        respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
        end
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

  def destroy
    authorize! :destroy, @task
    @task.destroy
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_board_section
    @boardsection = BoardSection.find(params[:task][:board_section_id])
  end

  def task_params
    params.require(:task).permit(:id, :name, :description, :status, :due_date, :story_point,
                                 :user_id, user_ids: [])
  end

end
