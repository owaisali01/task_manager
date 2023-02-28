# frozen_string_literal: true

module Api
	module V1
	  class BoardSectionsController < ActionController::Base
			before_action :set_board_section_object, only: %i[show edit update delete]
			before_action :set_board_object, only: %i[create update]

			def index
				@boardsections = BoardSection.all
				render json: @boardsections
			end

			def show
				render json: @boardsection, status: 200
			end

			def create
				@boardsection = @board.board_sections.new(board_section_params)
				if @boardsection.save
					render json: @boardsection, status: 200
				else
					render status: :bad_request, errors:  @boardsection.errors.full_messages
				end
			end

			def update
				if @boardsection.update(board_section_params)
					render json: @boardsection, status: 200
				else
					render status: :bad_request, errors: @boardsection.errors.full_messages
				end
			end

			def destroy
				@boardsection = BoardSection.find(params[:id])
				if @boardsection.destroy
					render json: {message: "board section successfully deleted"}, status: 200
				else
					render status: :bad_request, errors: @boardsection.errors.full_messages
				end
			end

			private

			def set_board_section_object
				@boardsection = BoardSection.find_by(id: params[:id])
        render json: {message: "Board section not found"}, status: :unprocessable_entity unless @boardsection.present?
			end

			def set_board_object
				@board = Board.find_by(id: board_section_params[:board_id])
        render json: {message: "Board not found"}, status: :unprocessable_entity unless @board.present?
			end

			def board_section_params
				params.require(:board_section).permit(:id, :name, :board_id)
			end
	  end
	end
end