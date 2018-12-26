class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :position, defalut:0
    

      t.timestamps
    end
  end
end
