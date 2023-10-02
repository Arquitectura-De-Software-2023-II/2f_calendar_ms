class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
