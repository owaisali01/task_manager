class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.attachment :file
      t.timestamps
    end
  end
end
