class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :created
      t.integer :status, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
