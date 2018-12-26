class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
	  t.datetime :create_at 
	     


      t.timestamps
    end
  end
end
