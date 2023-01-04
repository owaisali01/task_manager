class RenameTypeToBoardType < ActiveRecord::Migration
  def change
    rename_column :boards, :type, :board_type
  end
end
