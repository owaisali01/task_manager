class BoardsController < ApplicationController
  before_action :set_board_object, only: %i[show edit update destroy]
  def index
    @boards = Board.all.page(params[:page])
    binding.pry
    @comments = Comment.all
  end

  def new
    @board = Board.new
  end

  def show
    @board_sections = @board.board_sections
  end

  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        format.html { redirect_to root_path }
        format.js
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.js { render layout: false }
      format.html { redirect_to @board }
    end
  end

  private

  def board_params
    params.require(:board).permit(:id, :name, :board_type, :board_section_id)
  end

  def set_board_object
    @board = Board.find(params[:id])
  end
end
