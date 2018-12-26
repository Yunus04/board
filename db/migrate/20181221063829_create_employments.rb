class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.integer :project_id
      t.string :employable_type
      t.integer :employable_id
      t.integer :status, default:0

      t.timestamps
    end
  end
end
