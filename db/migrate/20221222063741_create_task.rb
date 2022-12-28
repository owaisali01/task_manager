class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status
      t.datetime :due_date
      t.string :story_point
      t.references :board, index: true
      t.references :board_section, index: true
      t.references :user, index: true
    end
  end
end
