class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.integer :cod
      t.string :name
      t.boolean :available

      t.timestamps
    end
  end
end
