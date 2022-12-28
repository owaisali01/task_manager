class CreateBoardSections < ActiveRecord::Migration
  def change
    create_table :board_sections do |t|
      t.string :name
      t.references :board, index: true
    end
  end
end
