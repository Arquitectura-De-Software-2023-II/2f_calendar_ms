class AddClientIdToPet < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :client_id, :string
  end
end
