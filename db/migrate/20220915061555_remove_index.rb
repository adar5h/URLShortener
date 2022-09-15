class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :urls,name: "index_urls_on_user_id"
  end
end
