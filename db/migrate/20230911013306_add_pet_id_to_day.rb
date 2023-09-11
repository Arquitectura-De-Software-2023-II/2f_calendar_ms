class AddPetIdToDay < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :pet_id, :string
  end
end
