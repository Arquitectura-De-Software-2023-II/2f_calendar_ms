class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.integer :pet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
