class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
