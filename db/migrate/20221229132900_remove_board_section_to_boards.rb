class RemoveBoardSectionToBoards < ActiveRecord::Migration
  def change
    remove_reference :boards, :board_section, index: true, foreign_key: true
  end
end
