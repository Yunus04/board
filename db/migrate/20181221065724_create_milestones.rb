class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description		
      t.integer :project_id
      t.integer :team_id
      t.datetime :start_date
      t.date_time :end_date

      t.timestamps
    end
  end
end
