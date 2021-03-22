class AddTimestamp < ActiveRecord::Migration[5.2]
  def change
    add_column :user_entries, :created_at, :datetime
  end
end
