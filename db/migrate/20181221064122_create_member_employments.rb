class CreateMemberEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :member_employments do |t|
      t.integer :employment_id
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
