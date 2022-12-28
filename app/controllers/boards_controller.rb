class BoardsController < ApplicationController
  before_action :set_board_object, :only=> [:show,:edit,:update,:destroy]

  def index
    @boards = Board.all
  end
  def new
    @board = Board.new
  end
  def show
    @board_sections = @board.board_sections
     
  end
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render :new
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
  def delete
    @board.destroy
    redirect_to @board
  end

  private

    def board_params
      params.require(:board).permit(:id, :name, :type)
    end
    def set_board_object
      @board = Board.find(params[:id])
    end
      
end
