class AddColumnclick < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :click_count, :integer, default: 0
  end
end
