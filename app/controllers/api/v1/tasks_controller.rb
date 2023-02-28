# frozen_string_literal: true

module Api
	module V1
		class TasksController < ActionController::Base
			before_action :set_task, only: %i[show update destroy assign_task]
			before_action :set_board_section_object, only: %i[create update]
			before_action :set_user, only: [:assign_task]

			def index
				@tasks = Task.all
				render json: @tasks
			end

			def show
				render json: @task, status: 200
			end

			def create
				@task = @boardsection.tasks.new(task_params)
				if @task.save
					render json: @task, status: 200
				else
					render status: :bad_request, errors:  @task.error.message 
				end
			end

			def update
				if @task.update(task_params)
					render json: @task
				else
					render status: :bad_request, errors:  @task.error.message
				end
			end

			def destroy
				if @task.destroy
					render json: {message: "task successfully deleted"}, status: 200
				else
					render status: :bad_request, errors:  @task.error.message
				end
			end

			def assign_task
				@assign_user = @user.assigned_tasks.new(task_id: params[@task], user_id: params[@user])
				if @assign_user.save
					render json: {message: "task Assigned successfully"}, status: 200
				else
					render json: {message: "task cannot be assigned"}
				end
			end

			private
			def set_task
				@task = Task.find_by(id: params[:id])
				render json: {message: "task not found"}, status: :unprocessable_entity unless @task.present?
			end
			
			def set_user
				@user = User.find_by(id: params[:id])
        		render json: {message: "user not found"}, status: :unprocessable_entity unless @user.present?
			end

			def set_board_section_object
				@boardsection = BoardSection.find_by(id: task_params[:board_section_id])
        render json: {message: "Board section not found"}, status: :unprocessable_entity unless @boardsection.present?
			end

			def task_params
				params.require(:task).permit(:id, :name, :description, :status, :due_date, :story_point, :board_section_id)
			end
		end
	end
end