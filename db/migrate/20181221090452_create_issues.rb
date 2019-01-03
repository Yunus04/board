class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :code			
      t.string :title
      t.text :description
      t.datetime :created
      t.integer :status, default:0
      t.integer :project_id

      t.timestamps
    end
  end
end
