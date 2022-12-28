class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.references :task, index: true
      t.references :user, index: true
    end
  end
end
