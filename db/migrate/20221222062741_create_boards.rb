class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :type
      t.references :user, index: true
      t.references :board_section, index: true
      t.timestamps
    end
  end
end
