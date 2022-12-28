class CreateAssignedTask < ActiveRecord::Migration
  def change
    create_table :assigned_tasks do |t|
      t.references :user, index: true
      t.references :task, index: true
    end
  end
end
