class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.datetime :created
      t.integer :status, default:0

      t.timestamps
    end
  end
end
