class AddActiveToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_active, :integer
  end
end
