class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :document	
      t.integer :project_id

      t.timestamps
    end
  end
end
