class CreateItemNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_notes do |t|
      t.string :itemable_type
      t.integer :itemable_id

      t.timestamps
    end
  end
end
