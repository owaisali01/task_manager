class CreateSubTask < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :name
      t.string :status
      t.string :description
      t.datetime :due_date
      t.references :task, index: true
    end
  end
end
