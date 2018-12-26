class CreateReleaseNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :release_notes do |t|
      t.integer :project_id
      t.datetime :release
      
      t.timestamps
    end
  end
end
