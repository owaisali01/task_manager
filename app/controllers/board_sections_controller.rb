class BoardSectionsController < ApplicationController
    before_action :set_board_section_object, :only=>[:show,:edit,:update,:delete]
    before_action :set_board

    def index
      @board_sections = BoardSection.all
    end
    def new
        @board_section = @board.board_sections.build
    end
    def show
    end
    def create
      @board_section = @board.board_sections.build(board_section_params)
      if @board_section.save
        redirect_to request.referer
      else
        render :new
      end
    end
    def edit
    end
    def update
      if @board_section.update(board_section_params)
        redirect_to @board_section
      else
        render :edit
      end
    end
    def delete
      @board_section.destroy
      redirect_to @board_section
    end

    private
      def set_board
        @board = Board.find(params[:board_id])
      end
      def set_board_section_object
        @board_section = BoardSection.find(params[:id]) 
      end
      def board_section_params
        params.require(:board_section).permit(:id, :name, :board_type)
      end
end
