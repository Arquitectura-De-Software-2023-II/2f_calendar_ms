class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :cod
      t.string :title
      t.text :description
      t.datetime :begin
      t.datetime :end
      t.string :client_ID
      t.string :creator_ID
      t.string :event_type
      t.boolean :editable

      t.timestamps
    end
  end
end
