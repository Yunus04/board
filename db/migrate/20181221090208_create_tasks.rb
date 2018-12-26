class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :priority, default:0
      t.integer :project_id

      t.timestamps
    end
  end
end
