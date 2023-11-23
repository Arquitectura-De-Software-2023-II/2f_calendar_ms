class AddDayIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :day_id, :integer
  end
end
