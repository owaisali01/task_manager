class AddBoardSectionIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :board_section_id, :integer
  end
end
