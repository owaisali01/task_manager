# frozen_string_literal: true

module Api
  module V1
    class BoardsController < ActionController::Base
      before_action :set_board_object, only: %i[show update destroy]
      before_action :set_user_object, only: %i[create update]

      def index
        @boards = Board.all
        render json: @boards
      end

      def show
        render json: @board, status: 200
      end

      def create
        @board = @user.boards.new(board_params)
        if @board.save
            render json: @board, status: 200
        else
            render status: :unprocessable_entity, errors:  @board.errors.full_messages
        end
      end

      def update
        if @board.update(board_params)
          render json: @board, status: 200
        else
          render status: :unprocessable_entity, errors:  @board.errors.full_messages
        end
      end

      def destroy
        if @board.destroy
          render json: {message: "board successfully deleted"}, status: 200
        else
          render status: :unprocessable_entity, errors:  @board.errors.full_messages
        end
      end

      private

      def set_board_object
        @board = Board.find_by(id: params[:id])
        render json: {message: "Board not found"}, status: :unprocessable_entity unless @board.present?
      end

      def set_user_object
        @user = User.find_by(id: board_params[:user_id])
        render json: {message: "user not found"}, status: :unprocessable_entity unless @user.present?
      end

      def board_params
        params.require(:board).permit(:id, :name, :board_type, :user_id)
      end
    end
  end
end